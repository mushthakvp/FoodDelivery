import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'widget/bottom_bar.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: blackColor,
      ),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: Row(
        children: const [
          BottomWidget(
            iconColor: whiteColor,
            icon: Icons.favorite_outline,
            color: whiteColor,
            title: 'Add to WishList',
            backGroundColor: blackColor,
          ),
          BottomWidget(
            iconColor: blackColor,
            icon: Icons.shop_outlined,
            color: blackColor,
            title: 'Go to Cart',
            backGroundColor: whiteColor,
          ),
        ],
      ),
    );
  }
}
