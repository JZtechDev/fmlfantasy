import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class MonthlyInnerLeaderboardController extends GetxController {
  RxInt topPlayerCrouselIndex = 0.obs;
  RxInt colorPlayerCrouselIndex = 3.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();
  String token = '';
  late Map<String, dynamic> decodedToken;
  RxString userId = ''.obs;

  var sportName = Get.arguments['sportName'];

  void onNextPlayerCard() {
    carouselController.nextPage();
  }

  void onPreviousPlayerCard() {
    carouselController.previousPage();
  }

  @override
  Future<void> onInit() async {
    token = await getStringValuesSF();
    decodedToken = JwtDecoder.decode(token);
    userId.value = await decodedToken['nameid'];
    super.onInit();
  }
}
