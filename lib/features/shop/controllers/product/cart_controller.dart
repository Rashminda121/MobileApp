
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  // Variables
  RxInt noofCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt product QuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController| = VariationController.instance;

  CartController(){
    loardCardItems();

  }

  // Add items in the cart
  void addToCart (ProductModel product) {
    // Quantity Check
    if (productQuantityInCart.value < 1) {
    TLoaders.custom Toast (message: 'Select Quantity');
    return;
  }

  // Variation Selected?
  if (product.productType ProductType.variable.toString() && variationController.selectedVariation.value.id.isEmpty) {
    TLoaders.custom Toast (message: 'Select Variation');
    return;
  }

  // Out of Stock Status
  if (product.productType == ProductType.variable.toString()) {
    if (variationController.selectedVariation.value.stock < 1) {
      TLoaders.warningSnackBar (message: 'Selected variation is out of stock.', title: 'Oh Snap!');
      return;
    }
  } else {
    if (product.stock < 1) {
          TLoaders.warningSnackBar (message: 'Product is out of stock.', title: 'Oh Snap!');
          return;
        }
      }

      //convert the productModel to cartItemModel with the given quantity
      final selectedCartItem = convertToCartItem(product, productQuantityInCart.value);

      //check if the product is already in the cart
      int index = cartItems
      .indexWhere((element) => cartItem.productId == selectedCartItem.productId
      && cartItem.variationId == selectedCartItem.variationId);

      if(index >= 0){
        //this quantity is already added or updated/removed from the design cart
        cartItems[index].quantity = selectedCartItem.quantity;
      } else {
        //add the product to the cart
        cartItems.add(selectedCartItem);
      }

      updateCart();
      TLoaders.customToast(message:"Your product has been added to the cart ");
  }

  void addOneToCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0){
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    updateCart();
  }

  void removeOneFromCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem) => cartItem.productId == item.productId && cartItem.variationId == item.variationId);

    if (index >= 0){
      if(cartItems[index].quantity > 1){
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1? removeFromCartDialog(index) : cartItems.removeAt(index);
       
      }

      updateCart();
    }
  }


  voide removeFromCartDialog (int index){
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this item from the cart?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        TLoaders.customToast(message: 'Product removed from the cart');
        Get.back();

      },
      onCancel: () => () => Get.back(),
    );
  }

  //initialize already added items's count in the cart
  void updateAlreadyAddedProductCount (ProductModel product ){

    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if(variationId.isNotEmpty){
        productQuantityInCart.value = getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
      
    }

  }



 

  //this function converst a product model to cartItemModel
  CartItemModel convertToCartItem (productModel product , int quantity){
      if (product.productType == ProductType.single.toString()) {
        //reset variation in case of single product type
        variationController.resetSelectedAttributes();
      }

      final variation = variationController.selectedVariation.value;
      final isVariation = variation.id.isNoEmpty();
      final price = isVariation ? variation.salePrice > 0 ? variation.salePrice : variation.price : product.salePrice > 0.0 ? product.salePrice : product.price;

      return cartItemsModel(
        productId: product.id, 
        quantity: quantity, 
        variationId: variation.id , 
        image:  isVariation? variation.image : product.thumbnail, 
        brandName: product.brand != null ? product.brand!.name:'', 
        selectedVariation: isVariation ? variation.attributes : null,
      );
  }


  //update the cart
  void updateCart(){
   
    updateCardTotal();
    saveCardItems();
    cartItems.refresh();
  }

  void updateCardTotal(){
    double calculatedTotalPrice = 0.0;
    int calculatedTotalItems = 0;


    for (var item in cartItems){
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedTotalItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;

  }

  void saveCartItems(){
      final cartItemsString = cartItems.map((item) => item.toJson()).toList();
      TLocalStorage.instance().writeDate('cartItems', cartItemsString);
    }

    void loardCardItems(){
      final cartItemsString = TLocalStorage.instance().readData<List<dynamic>>('cartItems');
      if (cartItemsString != null){
        cartItems.assignAll(cartItemsString.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
        updateCartTotals();
      }
    }

    int getProductQuantityInCart(String productId){
      final foundItem = 
      cartItems.where((item) => item.productId == productId ) .fold(0, (previousValue, element) => previousValue + element.quantity);
      return foundItem;
    }

     int getVariationQuantityInCart(String productId , String variationId){
      final foundItem = cartItems.where(
        (item) => item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty(),
      );

      return foundItem.quantity;
      
    }

    void clearCart(){
      getProductQuantityInCart.value = 0;
      cartItems.clear();
      updateCart();
    }


}