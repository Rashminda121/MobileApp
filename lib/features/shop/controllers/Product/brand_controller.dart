import "package:get/get.dart";
 





class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  Rxbool isloading = true.obs;
  final Rxlist<Brandmodel> featureBrands = <BrandModel>[].obs;
  final Rxlist<Brandmodel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit();{
  super.onInit();
  }
  

Future<void> getFeautrueeBrands()async{
  try{
    //show loader while loading Brands
    isLoading.value = true;

    final brands = await brandRepository.getAllbrands();

    allBrands.assignAll(brands);

    featureBrands.assign(allBrands.where(brand) =>brand.isFeatured ?? false).take(4));

  }catch (e){
    TLoaders.errorSnackbar(title:'oh snap!',message:e.tostring());
  }finally{
    //stop loader
    isLoading.value = false;
  }
}
///Get brand specific products from your data source
Future<list><ProductModel>> getbrandProducts({String brandID,int limit= -1}) async{
  final products = await productRepository.instance.getProductsForBrand(brandID:brandID);
  return products;
  catch(e){
    Tloaders.errorSnackbar(title:'oh snap!',message: e.toString());
    return[];
  }
}
  }
