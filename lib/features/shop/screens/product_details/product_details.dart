import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        /// 1- Product image Slider
        TCurvedEdgesWidget(
          child: Container(),
        ),
      ],
    )));
  }
}
