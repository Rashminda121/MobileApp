import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final carousalCurrentIndex = 8.obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}