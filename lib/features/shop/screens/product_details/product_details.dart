// import 'package:flutter/material.dart';
// import 'package:mobile_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
// import 'package:mobile_app/utils/helpers/helper_functions.dart';
// import 'package:mobile_app/utils/constants/colors.dart';
// import 'package:mobile_app/utils/constants/image_strings.dart';
// import 'package:mobile_app/utils/constants/sizes.dart';
//
// class ProductDetail extends StatelessWidget {
//   const ProductDetail({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// 1- Product image Slider
//             TCurvedEdgesWidget(
//               child: Container(
//                 color: dark ? TColors.darkerGrey : TColors.light,
//                 child: const Stack(
//                   children: [
//                     /// Main Large Image
//                     SizedBox(
//                         height: 400,
//                         child: Padding(
//                           padding: EdgeInsets.all(TSizes.productImageRadius),
//                           child: Center(
//                               child: Image(
//                                   image: AssetImage(TImages.productImage1))),
//                         )),
//
//                     ///imag slider
//                     TRoundedImage(imageURL: imageUrl)
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
