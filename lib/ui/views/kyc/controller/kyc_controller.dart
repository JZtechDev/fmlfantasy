import 'dart:developer';
import 'dart:io';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/kyc/views/employements_status_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_idensic_mobile_sdk_plugin/flutter_idensic_mobile_sdk_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KycController extends GetxController {
  GlobalKey<FormState> adressFormKey = GlobalKey<FormState>();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController adressSuplementsController = TextEditingController();

  String kycId = '';

  String _emplyementStatus = 'Employee';

  String get emplyementStatus => _emplyementStatus;

  set emplyementStatus(String value) {
    _emplyementStatus = value;
    update();
  }

  File? image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

//Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      update();
    }
  }

  void clearImage() {
    image = null;
    update();
  }

  void completeAdress() {
    if (adressFormKey.currentState!.validate()) {
      Get.to(() => const EmployementsStatusView());
    }
  }

  void launchSDK() async {
    final String accessToken = kycId;

    onTokenExpiration() async {
      return Future<String>.delayed(
          const Duration(seconds: 2), () => "your new access token");
    }

    onStatusChanged(
        SNSMobileSDKStatus newStatus, SNSMobileSDKStatus prevStatus) {
      log("The SDK status was changed: $prevStatus -> $newStatus");

      if (newStatus == SNSMobileSDKStatus.Failed) {
        log("SDK failed to launch.");
      } else if (newStatus == SNSMobileSDKStatus.Ready) {
        log("SDK is ready.");
      } else {
        log("Other status: $newStatus");
      }
    }

    final snsMobileSDK = SNSMobileSDK.init(accessToken, onTokenExpiration)
        .withHandlers(onStatusChanged: onStatusChanged)
        .withDebug(true)
        .build();

    try {
      final SNSMobileSDKResult result = await snsMobileSDK.launch();
      log("Completed with result: $result");
    } catch (e) {
      log("Error launching SDK: $e");
    }
  }

  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    kycId = prefs.getString('kycSid') ?? '';
    log('kycId: $kycId');

    super.onInit();
  }

  // late final WebViewController controller;

  // void onInit() {
  //   controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           // Update loading bar.
  //         },
  //         onPageStarted: (String url) {},
  //         onPageFinished: (String url) {},
  //         onHttpError: (HttpResponseError error) {},
  //         onWebResourceError: (WebResourceError error) {},
  //         onNavigationRequest: (NavigationRequest request) {
  //           if (request.url.startsWith('https://www.youtube.com/')) {
  //             return NavigationDecision.prevent;
  //           }
  //           return NavigationDecision.navigate;
  //         },
  //       ),
  //     )
  //     ..loadRequest(Uri.parse('https://www.jztech.co/'));
  //   super.onInit();
  // }

  // var config = ScannerConfig.withScenario(Scenario.FULL_PROCESS);

  // Future<void> startDocumentScan() async {
  //   try {
  //     DocumentReader.instance.scan(config, (action, results, error) {
  //       if (action == DocReaderAction.COMPLETE) {
  //         log('Scan complete: $results');
  //       } else if (action == DocReaderAction.TIMEOUT) {
  //         log('Scan timeout');
  //       } else if (error != null) {
  //         log('Scan error: $error');
  //         log('Error details: ${error.message}');
  //       }
  //     });
  //   } catch (e) {
  //     log('Exception during scan: $e');
  //   }
  // }

  // @override
  // void onInit() {
  //   Permission.camera.request();
  //   config = ScannerConfig.withScenario(Scenario.FULL_PROCESS);
  //   super.onInit();
  // }
}
