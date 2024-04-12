import 'package:mobile_app/features/shop/controllers/category_model.dart';
import 'package:mobile_app/features/shop/models/banner_model.dart';
import 'package:mobile_app/routes/routes.dart';
import 'package:mobile_app/utils/constants/image_strings.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.promobanner, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.promobanner, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.promobanner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.promobanner3, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.promobanner, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.promobanner, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.promobanner3, targetScreen: TRoutes.checkout, active: false),
    BannerModel(imageUrl: TImages.promobanner2, targetScreen: TRoutes.search, active: true),
  ];

  // static final UserModel user = UserModel(
  //   id: '1',
  //   firstName: 'John',
  //   lastName: 'Doe',
  //   email: 'john.doe@example.com',
  //   phoneNumber: '1234567890',
  //   profilePicture: TImages.profile,
  //   address: AddressModel(
  //     id: '1',
  //     name: 'John Doe',
  //     phoneNumber: '1234567890',
  //     street: '123 Main St',
  //     city: 'Anytown',
  //     state: 'Anystate',
  //     postalCode: '12345',
  //     country: 'USA',
  //   ),
  // );

  ///-- Cart
  // static final CartModel cart = CartModel(
  //   id: '1',
  //   products: [],
  //   totalPrice: 0,
  // );

  ///-- Order
  //static final List<OrderModel> orders = [];

  ///-- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: TImages.shoeIcon,
      name: 'Sports',
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      image: TImages.shoeIcon,
      name: 'Furniture',
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      image: TImages.shoeIcon,
      name: 'Electronics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      image: TImages.shoeIcon,
      name: 'Clothes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      image: TImages.shoeIcon,
      name: 'Animals',
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      image: TImages.shoeIcon,
      name: 'Shoes',
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      image: TImages.shoeIcon,
      name: 'Cosmetics',
      isFeatured: true,
    ),
    CategoryModel(
      id: '14',
      image: TImages.shoeIcon,
      name: 'Jewelery',
      isFeatured: true,
    ),
  ];

  /// Subcategories
  static final List<CategoryModel> subcategories = [
    CategoryModel(
      id: '8',
      image: TImages.shoeIcon,
      name: 'Sport Shoes',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '9',
      image: TImages.shoeIcon,
      name: 'Track suits',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      image: TImages.shoeIcon,
      name: 'Sports Equipments',
      parentId: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '11',
      image: TImages.shoeIcon,
      name: 'Bedroom furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '12',
      image: TImages.shoeIcon,
      name: 'Kitchen furniture',
      parentId: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      image: TImages.shoeIcon,
      name: 'Office furniture',
      parentId: '5',
      isFeatured: false,
    ),
  ];
}
  // More code...
