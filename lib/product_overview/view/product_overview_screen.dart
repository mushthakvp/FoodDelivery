import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'widget/bottom_bar.dart';

class ProductOverviewScreen extends StatelessWidget {
  final String image;
  const ProductOverviewScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            height: size.width,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Fresh Basil', style: gFontsOleo(sz: 25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$50 MRP', style: gFontsOleo(sz: 20)),
                    Text('50 in a Stock', style: gFontsOleo(sz: 20)),
                  ],
                ),
                Text('Description', style: gFontsOleo(sz: 20, cl: greyColor)),
                Text("Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem.", style: gFontsOleo(sz: 16)),
              ],
            ),
          ),
        ],
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
            icon: Icons.shopping_bag,
            color: blackColor,
            title: 'Buy now',
            backGroundColor: whiteColor,
          ),
        ],
      ),
    );
  }
}
