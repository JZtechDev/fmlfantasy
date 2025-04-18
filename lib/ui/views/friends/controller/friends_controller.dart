import 'dart:developer';
import 'package:fmlfantasy/app/textstyles/textstyle.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/contacts_model.dart';
import 'package:fmlfantasy/services/friends_services.dart';
import 'package:fmlfantasy/ui/views/friends/widget/add_contact_modal.dart';
import 'package:fmlfantasy/ui/views/friends/widget/add_groups_modal.dart';
import 'package:fmlfantasy/ui/views/friends/widget/add_remove_members_modal.dart';
import 'package:fmlfantasy/ui/views/friends/widget/delete_modal.dart';
import 'package:fmlfantasy/ui/views/friends/widget/edit_contact_modal.dart';
import 'package:fmlfantasy/ui/views/friends/widget/edit_team_modal.dart';
import 'package:country_picker/country_picker.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class FriendsController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyGroup = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController additionalEmailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController groupNameController = TextEditingController();
  TextEditingController editGroupNameController = TextEditingController();
  final controller = MultiSelectController<GetContacts>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoadingSet(bool value) {
    _isLoading = value;
    update();
  }

  List selectContacts = [];
  List selectContactsId = [];
  RxList<GetGroupMembers> groupMembers = <GetGroupMembers>[].obs;
  bool _isContact = true;
  String token = '';

  bool get isContact => _isContact;

  set isContactSet(bool value) {
    _isContact = value;
    update();
  }

  @override
  void onInit() async {
    token = await getStringValuesSF();
    await getContactsList();
    await getGroupsList();
    super.onInit();
  }

  void selectedContacts(GetContacts contact) {
    if (selectContacts.contains(contact)) {
      selectContacts.remove(contact);
      update();
    } else {
      selectContacts.add(contact);
      update();
    }
  }

  void selectAllContacts() {
    selectContacts.assignAll(filteredData);
    update();
  }

  void clearAll() {
    selectContacts.clear();
    update();
  }

  RxList<GetContacts> getContacts = <GetContacts>[].obs;

  RxList<GetContacts> filteredData = <GetContacts>[].obs;

  Future<List<GetContacts>> getContactsList() async {
    try {
      List<GetContacts> response = await FriendsServices.getContacts(token);
      getContacts.value = response;
      getContacts.sort(
        (a, b) =>
            a.fullName!.toLowerCase().compareTo(b.fullName!.toLowerCase()),
      );
      filteredData.value = List.from(getContacts);
      contacts.value = List.from(filteredData);
      // await addContactsToDropdown();
      return response;
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  RxList<GetGroups> groups = <GetGroups>[].obs;

  Future<List<GetGroups>> getGroupsList() async {
    try {
      List<GetGroups> response = await FriendsServices.getGroups(token);
      groups.value = response;
      return response;
    } catch (error) {
      log(error.toString());
      return [];
    }
  }

  Future<List<GetGroupMembers>> getGroupMembers(String token, String id) async {
    selectContactsId.clear();
    isLoadingSet = true;
    try {
      List<GetGroupMembers> response =
          await FriendsServices.getGroupMembers(token, id);
      groupMembers.value = response;
      log(response.length.toString());
      selectContactsId.addAll(groupMembers.map((e) => e.userId).toList());
      isLoadingSet = false;
      return response;
    } catch (error) {
      isLoadingSet = false;
      log(error.toString());
      return [];
    }
  }

  RxList<DropdownItem<GetContacts>> items = <DropdownItem<GetContacts>>[].obs;

  var countryP = CountryParser.parseCountryCode('PK').obs;
  RxString selectedcountryName = ''.obs;
  RxString fullPhoneNumber = ''.obs;

  void getFullPhoneNumber() {
    fullPhoneNumber.value =
        '${countryP.value.countryCode}${phoneController.text}';
  }

  Future<bool> submitDetails(String token) async {
    Map<String, dynamic> detailPost() {
      Contacts saveDetails = Contacts(
        email: emailController.text,
        fullName: nameController.text,
        alias: '',
        imageUrl: '',
        userName: '',
        mobile: '+${countryP.value.phoneCode}${phoneController.text}',
        additionalEmail: additionalEmailController.text,
      );
      return saveDetails.toJson();
    }

    return FriendsServices.addFriend(detailPost(), token);
  }

  Future<void> addContact() async {
    if (formKey.currentState!.validate()) {
      isLoadingSet = true;
      bool success = await submitDetails(token);
      if (success) {
        isLoadingSet = false;
        Get.close(1);
        Get.snackbar('Success', 'Contact added successfully');
        getContactsList();
        emailController.clear();
        nameController.clear();
        phoneController.clear();
        additionalEmailController.clear();
      } else {
        isLoadingSet = false;
        Get.snackbar('Error', 'Failed to add contact');
      }
    }
  }

  Future<bool> deleteContact(String contactId) async {
    isLoadingSet = true;
    bool success = await FriendsServices.deleteContact(token, contactId);
    if (success) {
      isLoadingSet = false;
      Get.close(1);
      Get.snackbar('Success', 'Contact deleted successfully');
      getContactsList();
      return true;
    } else {
      isLoadingSet = false;
      Get.snackbar('Error', 'Failed to delete contact');
      return false;
    }
  }

  Future<bool> deleteGroup(String groupId) async {
    isLoadingSet = true;
    bool success = await FriendsServices.deleteGroup(token, groupId);
    if (success) {
      isLoadingSet = false;
      Get.back();
      getGroupsList();
      Get.snackbar('Success', 'Group deleted successfully');

      return true;
    } else {
      isLoadingSet = false;
      Get.snackbar('Error', 'Failed to delete group');
      return false;
    }
  }

  Future<bool> addNewMember(
      String groupId, String memberId, String contactId) async {
    isLoadingSet = true;

    if (memberId == '') {
      isLoadingSet = false;
      Get.back();
      Get.snackbar('Error', 'User is not verified');
    } else {
      bool success =
          await FriendsServices.addGroupMember(groupId, memberId, token);
      if (success) {
        isLoadingSet = false;
        getGroupMembers(token, groupId);
        Get.back();
        Get.snackbar('Success', 'Member added successfully');

        return true;
      } else {
        isLoadingSet = false;
        Get.snackbar('Error', 'Failed to add member');
        return false;
      }
    }
    return false;
  }

  Future<bool> deleteGroupMember(String groupId, String memberId) async {
    isLoadingSet = true;
    bool success =
        await FriendsServices.deleteGroupMember(groupId, memberId, token);
    if (success) {
      isLoadingSet = false;
      getGroupMembers(token, groupId);
      Get.snackbar('Success', 'Member deleted successfully');
      return true;
    } else {
      isLoadingSet = false;
      Get.snackbar('Error', 'Failed to delete member');
      return false;
    }
  }

  void showContactsModal() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return const AddContactModal();
        });
  }

  void showGroupModal() {
    Get.dialog(const MakeGroupModal());
  }

  void showEditModel(String groupName, String groupId) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return EditGroupModal(
            teamName: groupName,
            groupId: groupId,
          );
        });
  }

  void showAddRemoveModal(String groupName, String groupId) {
    getGroupMembers(token, groupId);
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AddRemoveMembersModal(groupIds: groupId);
        });
  }

  void showDeleteModal(
    VoidCallback cancel,
    VoidCallback delete,
    String contactId,
  ) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return DeleteModal(
              onPressedCancle: cancel,
              onPressedDelete: () {
                deleteContact(contactId);
              });
        });
  }

  void showGroupDeleteModal(
    VoidCallback cancel,
    VoidCallback delete,
    String groupId,
  ) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return DeleteModal(
              onPressedCancle: cancel,
              onPressedDelete: () {
                deleteGroup(groupId);
              });
        });
  }

  void showEditContactModal(GetContacts contact) {
    nameController.text = contact.fullName.toString();
    emailController.text = contact.email.toString();
    phoneController.text = contact.mobile.toString();
    additionalEmailController.text = contact.additionalEmail.toString();
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return EditContactModal(contactId: contact.contactId!);
        });
  }

  Future<bool> creatGroup() async {
    if (formKeyGroup.currentState!.validate()) {
      isLoadingSet = true;
      bool success = await createGroupDetails(token);
      if (success) {
        isLoadingSet = false;
        Get.back();
        Get.snackbar('Success', 'Group created successfully');
        getGroupsList();
        controller.clearAll();
        selectContacts.clear();
        groupNameController.clear();
        return true;
      } else {
        isLoadingSet = false;
        Get.snackbar('Error', 'Failed to create group');
        return false;
      }
    } else {
      isLoadingSet = false;
      Get.snackbar('Error', 'Failed to create group');
      return false;
    }
  }

  Future<bool> createGroupDetails(String token) async {
    List<GroupMembers> selectedContacts = [];
    for (int i = 0; i < selectContacts.length; i++) {
      selectedContacts.add(GroupMembers(
        contactUserId: selectContacts[i].userId.toString(),
        contactUserIsAdmin: false,
      ));
    }
    Map<String, dynamic> detailPost() {
      Groups saveDetails = Groups(
        groupName: groupNameController.text,
        groupMembers: selectedContacts,
      );
      return saveDetails.toJson();
    }

    return FriendsServices.createGroup(detailPost(), token);
  }

  Future<bool> editGroupName(String groupId) async {
    bool success = await FriendsServices.editGroupName(
        token, groupId, editGroupNameController.text);
    if (success) {
      isLoadingSet = false;
      Get.back();
      Get.snackbar('Success', 'Group name updated successfully');
      getGroupsList();

      return true;
    } else {
      isLoadingSet = false;
      Get.snackbar('Error', 'Failed to update group name');
      return false;
    }
  }

  Future<bool> editConatactDetails(String token, String contactId) async {
    Map<String, dynamic> detailPost() {
      Contacts saveDetails = Contacts(
        email: emailController.text,
        fullName: nameController.text,
        alias: '',
        imageUrl: '',
        userName: '',
        mobile: '+${countryP.value.phoneCode}${phoneController.text}',
        additionalEmail: additionalEmailController.text,
        contactUserId: contactId,
      );
      return saveDetails.toJson();
    }

    return FriendsServices.editContact(token, detailPost());
  }

  Future<bool> editContact(String contactId) async {
    isLoadingSet = true;
    bool success = await editConatactDetails(token, contactId);
    if (success) {
      isLoadingSet = false;
      Get.back();
      Get.snackbar('Success', 'Contact updated successfully');
      getContactsList();
      emailController.clear();
      nameController.clear();
      phoneController.clear();
      additionalEmailController.clear();
      return true;
    } else {
      isLoadingSet = false;
      Get.snackbar('Error', 'Failed to update contact');
      return false;
    }
  }

  Future<void> selectCountry(BuildContext context) async {
    showCountryPicker(
        context: context,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: Colors.white,
          textStyle:
              globalTextStyle(fontSize: 12.sp, color: AppColors.textGray),
          bottomSheetHeight: 500,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          inputDecoration: InputDecoration(
            labelText: 'Search Country',
            labelStyle:
                globalTextStyle(fontSize: 12.sp, color: AppColors.textGray),
            fillColor: AppColors.grey,
            filled: true,
            hintText: 'Search Country',
            hintStyle:
                globalTextStyle(fontSize: 12.sp, color: AppColors.textGray),
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.textGray,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide: const BorderSide(
                color: AppColors.errorRed,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0.r),
              borderSide: const BorderSide(
                color: AppColors.errorRed,
              ),
            ),
            contentPadding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 13.h,
              bottom: 13.h,
            ),
          ),
        ),
        onSelect: (Country country) {
          selectedcountryName.value = country.name;
          log(selectedcountryName.value);
          countryP.value = country;
        });
  }
}
