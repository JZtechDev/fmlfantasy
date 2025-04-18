import 'package:fmlfantasy/app/app%20routes/app_routes.dart';
import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/services/profile_service/profile_services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  ProfileServices profileServices = ProfileServices();
  String token = '';
  RxList<AccountDetailsModel> accountDetailsList = <AccountDetailsModel>[].obs;
  RxString local = ''.obs;

  RxBool isBiometricEnabled = false.obs;

  @override
  void onInit() async {
    getLocal();
    token = await getStringValuesSF();
    await fetchProfile();
    checkBiometrics();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    try {
      final data = await profileServices.getProfile(token);
      accountDetailsList.add(data);
    } catch (e) {
      throw Exception('Failed to fetch profile');
    }
  }

  void checkBiometrics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isBiometricEnabled.value = prefs.getBool('isBiometricEnabled') ?? false;
  }

  void enableBiometrics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isBiometricEnabled', true);
    isBiometricEnabled.value = true;
  }

  void disableBiometrics() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isBiometricEnabled', false);
    isBiometricEnabled.value = false;
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Get.offAllNamed(AppRoutes.authentication);
  }

  void setLocal(String local) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('local', local);
  }

  void getLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    local.value = prefs.getString('local') ?? 'test';
  }
}
