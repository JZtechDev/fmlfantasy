import 'package:fmlfantasy/app/app_colors/app_colors.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/services/profile_service/profile_service_upload_avatar.dart';
import 'package:fmlfantasy/services/profile_service/profile_services.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AccountDetailsController extends GetxController {
  RxList<AccountDetailsModel> accountDetailsList = <AccountDetailsModel>[].obs;
  ProfileServices profileServices = ProfileServices();
  String token = '';
  var selectedCountry =
      CountryParser.parseCountryCode('IN').obs; // default country
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Rx<XFile?> imageFile = Rx<XFile?>(null);
  final ImagePicker picker = ImagePicker();
  RxList avatars = [].obs;
  RxString imageUrl = ''.obs;

  @override
  void onInit() async {
    accountDetailsList = Get.arguments['details'];
    token = await getStringValuesSF();
    showDob.value = accountDetailsList[0].dateOfBirth!;
    avatars.value = await ProfileServices.fetchAvatars(token);

    super.onInit();
  }

  // Initialize the controllers with data
  void initData(AccountDetailsModel data) {
    emailController.text = data.email ?? '';
    mobileController.text = data.mobile ?? '';
    lastNameController.text = data.lastName ?? '';
    usernameController.text = data.userName ?? '';
    firstNameController.text = data.firstName ?? '';
    cityController.text = data.city ?? '';
    dobController.text = data.dateOfBirth ?? '';
    postalCodeController.text = data.postalCode ?? '';
    addressController.text = data.address ?? '';
    selectedCountry.value = CountryParser.parseCountryCode(data.country!);
  }

  Future<void> updateProfile() async {
    final updatedData = {
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "mobile": mobileController.text,
      "username": usernameController.text,
      "country": selectedCountry.value.countryCode,
      "city": cityController.text,
      'dateOfBirth': showDob.value,
      "postalCode": postalCodeController.text,
      "address": addressController.text,
    };

    final result = await profileServices.updateProfile(
      token,
      updatedData,
    );
    if (result) {
      accountDetailsList[0].firstName = firstNameController.text;
      accountDetailsList[0].lastName = lastNameController.text;
      accountDetailsList[0].mobile = mobileController.text;
      accountDetailsList[0].userName = usernameController.text;
      accountDetailsList[0].country = selectedCountry.value.countryCode;
      accountDetailsList[0].city = cityController.text;
      accountDetailsList[0].dateOfBirth = showDob.value;
      accountDetailsList[0].postalCode = postalCodeController.text;
      accountDetailsList[0].address = addressController.text;
      accountDetailsList.refresh();
      Get.back();
      Get.snackbar('Success', 'Profile updated successfully');
    } else {
      //Get.snackbar('Error', 'Failed to update profile');
      // log('Failed to update profile');
    }
  }

  var dob = Rx<DateTime?>(null);
  RxString showDob = ''.obs;
  RxString dateOfBirth = ''.obs;
  Future<void> selectDateOfBirth(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dob.value,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              surfaceTint: AppColors.white,
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.dark,
            ),
            dialogBackgroundColor: Colors.yellow,
          ),
          child: child!,
        );
      },
    );
    //2019-01-06T17:16:40

    if (pickedDate != null && pickedDate != dob.value) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      formattedDate = formattedDate.replaceRange(
          2, 5, formattedDate.substring(2, 5).toLowerCase());

      dob.value = pickedDate;
      dateOfBirth.value = pickedDate.toIso8601String();
      showDob.value = formattedDate;
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile.value = pickedFile;
        // print(imageFile.value!.path);
      }
    } catch (e) {
      Get.snackbar("Error", "Error picking image: $e");
    }
  }

  Future<void> takePhoto() async {
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        imageFile.value = pickedFile;
        //await uploadAvatarImage();
      }
    } catch (e) {
      //print('Error taking photo: $e');
      Get.snackbar("Error", "Error taking photo: $e");
    }
  }

  Future<void> uploadAvatarImage(String imageUrl) async {
    bool success = await ProfileServiceUploadAvatar.uploadAvatarFile(
      imageUrl: imageUrl,
      token: token,
    );
    if (success) {
      Get.snackbar("Success", "Avatar uploaded successfully!");
      changeImageUrl(imageUrl);
      //fetchProfile();
      //accountDetailsList;
    } else {
      Get.snackbar("Error", "Failed to upload avatar");
      // print('Failed to upload avatar');
    }
  }

  void changeImageUrl(String newUrl) {
    accountDetailsList[0].imageUrl?.value = newUrl;
  }
}
