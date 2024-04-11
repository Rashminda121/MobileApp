
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mobile_app/data/repositories.authentication/banners/banner_repository.dart';
import 'package:mobile_app/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{

  ///variables
  final isLoading= false.obs;
  final carousalCurrentIndex = 8.obs;
  final RxList<BannerModel> banners= <BannerModel>[].obs;


  @override
  void onInIt(){
    fetchBanners();
    super.onInit();
  }

  ///update page navigational dates
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  ///fetch banners
  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      //fetch banners
      final bannerRepo= Get.put(BannerRepository());
      final banners=await bannerRepo.fetchBanners();

      //Assign banners
      this.banners.assignAll(banners);


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

}
