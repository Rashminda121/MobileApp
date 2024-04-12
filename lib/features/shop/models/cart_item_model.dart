Class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationid;
  String? brandName;
  Map<String, String>? selectedVariation;


/// Constructor
CartItemModel({
    required this.productId,
    required this.quantity, this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title ='',
    this.brandName,
    this.selectedVariation,
  });


/// Empty Cart
static CartItemModel empty() => CartItemModel(productId:'', quantity: 0);


/// Convert a Cart items to a JSON 
    Map<String, dynamic> toJson() {
      return {
        'productId': productId,
        'title': title,
        'price': price,
        'image': image,
        'quantity': quantity,
        'variationId': variationId,
        'brandName': brandName,
        'selectedVariation': selectedVariation,
      };
    }

    //create a cart item from json map
    factory CartItemModel.fromJson(Map<String, dynamic> json) {
      return CartItemModel(
        productId: json['productId'],
        title: json['title'],
        price: json['price']?.toDouble(),
        image: json['image'],
        quantity: json['quantity'],
        variationId: json['variationId'],
        brandName: json['brandName'],
        selectedVariation: json['selectedVariation'] != null
            ? Map<String, String>.from(json['selectedVariation'])
            : null,

      );
    };
}
