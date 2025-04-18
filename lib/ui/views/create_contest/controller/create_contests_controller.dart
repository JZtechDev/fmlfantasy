import 'dart:developer';

import 'package:fmlfantasy/app/app_images/app_images.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/contacts_model.dart';
import 'package:fmlfantasy/model/inivitations_model.dart';
import 'package:fmlfantasy/model/private_contest.dart';
import 'package:fmlfantasy/model/sports_type.dart';
import 'package:fmlfantasy/model/tournament_model.dart';
import 'package:fmlfantasy/services/create_private_contest.dart';
import 'package:fmlfantasy/services/friends_services.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CreateContestsController extends GetxController {
  RxInt activeStep = 0.obs;
  RxInt sportsIndex = 0.obs;
  RxInt selectedIndex = 0.obs;
  var stepCompleted = [false, false, false].obs;
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final RxString groupSearchQuery = ''.obs;
  final formKey = GlobalKey<FormState>();
  final form2Key = GlobalKey<FormState>();
  String matchID = Get.arguments['matchID'];
  String sportCode = Get.arguments['sport'];
  String tournamentId = Get.arguments['tournamentId'];
  String joinCode = Get.arguments['joinCode'];
  String matchStarttartdate = Get.arguments['startDate'];
  String matchEndDate = Get.arguments['endDate'];
  Tournaments tournament = Get.arguments['tournament'];
  RxString payWith = ''.obs;
  TextEditingController contestNameController = TextEditingController();
  TextEditingController inviteFriendsController = TextEditingController();
  final PageController pageController = PageController();
  final step2FromKey = GlobalKey<FormState>();
  String uri = '';
  String generatedId = '';
  String matchId = '';
  String tournamentCode = '';
  String joinCodeId = '';
  RxBool isloading = false.obs;
  bool _isContact = true;
  String token = '';
  bool get isContact => _isContact;

  set isContactSet(bool value) {
    _isContact = value;
    update();
  }

  //RxList<GetContacts> getContacts = <GetContacts>[].obs;
  RxList<GetContacts> filteredData = <GetContacts>[].obs;
  RxList<GetContacts> selectedMembers = <GetContacts>[].obs;
  List contactIds = [];
  List groupIds = [];

  void addMember(GetContacts member) {
    if (selectedMembers.contains(member)) {
      selectedMembers.remove(member);
      contactIds.remove(member.userId);
      update();
      refresh();
    } else {
      selectedMembers.add(member);
      contactIds.add(member.userId);
      update();
      refresh();
    }
  }

  void handleRefresh() async {
    onInit();
    update();
  }

  void filterData() {
    if (searchQuery.value.isEmpty) {
      filteredData.assignAll(contacts);
    } else {
      filteredData.assignAll(contacts.where((e) =>
          e.fullName!.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          e.email!.toLowerCase().contains(searchQuery.value.toLowerCase())));
    }
  }

  void filterGroupData() {
    if (groupSearchQuery.value.isEmpty) {
      groupsFilterData.assignAll(groups);
    } else {
      groupsFilterData.assignAll(groups.where((e) => e.userGroupName!
          .toLowerCase()
          .contains(groupSearchQuery.value.toLowerCase())));
    }
  }

  Future<List<GetContacts>> getContactsList() async {
    try {
      List<GetContacts> response = await FriendsServices.getContacts(token);
      contacts.value = response;
      contacts.sort(
        (a, b) =>
            a.fullName!.toLowerCase().compareTo(b.fullName!.toLowerCase()),
      );
      filterData();
      return response;
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  RxList<GetGroups> groups = <GetGroups>[].obs;
  RxList<GetGroups> groupsFilterData = <GetGroups>[].obs;
  RxList<GetGroups> selectedGroups = <GetGroups>[].obs;

  void addGroup(GetGroups group) {
    if (selectedGroups.contains(group)) {
      selectedGroups.remove(group);
      groupIds.remove(group.userGroupId!);
    } else {
      selectedGroups.add(group);
      groupIds.add(group.userGroupId!);
    }
  }

  Future<List<GetGroups>> getGroupsList() async {
    try {
      List<GetGroups> response = await FriendsServices.getGroups(token);
      groups.value = response;
      filterGroupData();
      return response;
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  RxString selectedSport = 'BB'.obs;
  RxList<Sport> sportsList = <Sport>[
    Sport(title: 'BB', icon: AppImages.baseketball, name: 'B-ball'),
    Sport(title: 'FB', icon: AppImages.footballsvg, name: 'Football'),
    Sport(title: 'CR', icon: AppImages.cricket, name: 'Crick'),
    Sport(title: 'AF', icon: AppImages.americanFootballsvg, name: 'Football'),
    Sport(title: 'BL', icon: AppImages.baseballsvg, name: 'Base'),
    Sport(title: 'HK', icon: AppImages.iceHockeysvg, name: 'Hockey'),
  ].obs;

  void navigateToHome() {
    Get.offAllNamed(AppRoutes.home);
  }

  RxBool isSwitched = false.obs;
  RxBool isSwitched2 = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController entryFeeController = TextEditingController();
  //RxList<Matches> matchList = <Matches>[].obs;
  RxList<Members> peopleList = <Members>[].obs;

  void addPerson(String email, String name) {
    peopleList.add(Members(email: email, name: name));
    update();
  }

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat dateFormatter = DateFormat('dd MMMM yyyy - hh:mm a');
    return dateFormatter.format(dateTime.toLocal());
  }

  void removePerson(int index) {
    if (index >= 0 && index < peopleList.length) {
      peopleList.removeAt(index);
      update();
    }
  }

  void completeStep(int step) {
    activeStep.value++;
    stepCompleted[step] = true;
    update();
  }

  bool canTapStep(int step) {
    if (step == 0) return true;
    return stepCompleted[step - 1];
  }

  void moveToPreviousStep() {
    if (activeStep.value > 0) {
      activeStep.value--;
    }
  }

  void makeAdmin(index) {
    peopleList[index].isAdmin = !peopleList[index].isAdmin;
    update();
  }

  void toggleSwitch(bool value) {
    isSwitched.value = value;
    update();
    payWith.value = '';
    isSwitched.value
        ? entryFeeController.text = '1'
        : entryFeeController.text = '0';
  }

  String getIconPath(String sportName) {
    switch (sportName) {
      case 'BB':
        return AppImages.baseketball;
      case 'FB':
        return AppImages.footballsvg;
      case 'CR':
        return AppImages.cricket;
      case 'AF':
        return AppImages.americanFootballsvg;
      case 'BL':
        return AppImages.baseballsvg;
      case 'HK':
        return AppImages.iceHockeysvg;
      default:
        return AppImages.iceHockeysvg;
    }
  }

  String getTextPath(String sportName) {
    switch (sportName) {
      case 'BB':
        return 'Basketball';
      case 'FB':
        return 'Football';
      case 'CR':
        return 'Cricket';
      case 'AF':
        return 'American Football';
      case 'BL':
        return 'Baseball';
      case 'HK':
        return 'Ice Hockey';

      default:
        return '';
    }
  }

  Future<void> confirmContestSubmit() async {
    createPrivateContest();
  }

  String getMatchCode(Map<String, dynamic> data) {
    List<dynamic> matches = data['matches'];
    if (matches.isNotEmpty) {
      String matchCode = matches[0]['matchCode'];
      matchId = matchCode;
      log(matchCode);
      return matchCode;
    } else {
      log('No matches found');
      return '';
    }
  }

  void getMatchData(Map<String, dynamic> data) {
    String joinCode = data['joinCode'];
    String id = data['id'];
    tournamentCode = id;
    joinCodeId = joinCode;
    getMatchCode(data);
    String sports;
    log(id);
    switch (selectedSPort.value) {
      case 'BB':
        sports = 'basketball';
        break;
      case 'FB':
        sports = 'football';
        break;
      case 'CR':
        sports = 'cricket';
        break;
      case 'AF':
        sports = 'americanfootball';
        break;
      case 'BL':
        sports = 'baseball';
        break;
      case 'HK':
        sports = 'icehockey';
        break;
      default:
        sports = 'icehockey';
    }

    List<String> parts = id.split('-');
    String simplifiedId =
        parts.sublist(parts.length - 6, parts.length - 2).join('-');
    generatedId = simplifiedId;
    log(simplifiedId);
    uri =
        'https://aliv-dev.fantasybulls.com/$sports/invite?joinCode=$joinCode?tournamentId=$simplifiedId';
    log(uri);
    CreatePrivateContestServices.invite(token, invitePost(), id);
  }

  Future<Map<String, dynamic>> createPrivateContest() async {
    isloading.value = true;
    try {
      Map<String, dynamic> data =
          await CreatePrivateContestServices.createPrivateContestData(
              selectedSport.value, token, detailPost());
      if (data.isNotEmpty) {
        getMatchData(data);
        // String joinCode = data['joinCode'];
        // String id = data['id'];
        // tournamentCode = id;
        // joinCodeId = joinCode;
        // getMatchCode(data);
        // String sports;
        // log(id);
        // switch (selectedSPort.value) {
        //   case 'BB':
        //     sports = 'basketball';
        //     break;
        //   case 'FB':
        //     sports = 'football';
        //     break;
        //   case 'CR':
        //     sports = 'cricket';
        //     break;
        //   case 'AF':
        //     sports = 'americanfootball';
        //     break;
        //   case 'BL':
        //     sports = 'baseball';
        //     break;
        //   case 'HK':
        //     sports = 'icehockey';
        //     break;
        //   default:
        //     sports = 'icehockey';
        // }

        // List<String> parts = id.split('-');

        // // Take only the last 3 parts before the hash (NZ, PAK, 16032025 or 18032025)
        // String simplifiedId =
        //     parts.sublist(parts.length - 6, parts.length - 2).join('-');
        // generatedId = simplifiedId;
        // log(simplifiedId);
        // uri =
        //     'https://aliv-dev.fantasybulls.com/$sports/invite?joinCode=$joinCode?tournamentId=$simplifiedId';
        // log(uri);

        Get.toNamed(
          AppRoutes.privateContestSuccessView,
        );
        isloading.value = false;
        return data;
      } else {
        isloading.value = false;
        return {};
      }
    } catch (error) {
      isloading.value = false;
      rethrow;
    }
  }

  Map<String, dynamic> invitePost() {
    Invitations saveDetails = Invitations(
      contactUserIds: contactIds,
      userGroupIds: groupIds,
    );
    return saveDetails.toJson();
  }

  Map<String, dynamic> detailPost() {
    List<Members> members = [];

    for (int i = 0; i < selectedMembers.length; i++) {
      members.add(Members(
        email: selectedMembers[i].email!,
        name: selectedMembers[i].fullName!,
      ));
    }

    CreatePrivateContest saveDetails = CreatePrivateContest(
      name: contestNameController.text,
      sportCode: sportCode,
      competitionCode: tournamentId,
      matchCode: matchID,
      isMultiMatch: false,
      startDate: matchStarttartdate,
      endDate: matchEndDate,
      maxParticipants: 10,
      entryFee: entryFeeController.text == ''
          ? 0
          : int.parse(entryFeeController.text),
      joinCode: null,
    );
    return saveDetails.toJson();
  }

  late Map<String, dynamic> decodedToken;

  @override
  void onInit() async {
    token = await getStringValuesSF();
    getContactsList();
    getGroupsList();
    decodedToken = JwtDecoder.decode(token);
    searchQuery.listen((query) => filterData());
    groupSearchQuery.listen((query) => filterGroupData());
    log(sportCode);
    super.onInit();
  }
}
