import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/core/styles/images.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import 'widget/all_info_widget.dart';
import 'widget/bottom_bar.dart';

class ProductOverviewScreen extends StatelessWidget {
  final HomeProductModel data;
  const ProductOverviewScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scafoldColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            splashRadius: 26,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            splashRadius: 26,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Hero(
            tag: data.productName,
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data.productBackdrop),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                AllInfoWidget(data: data),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(sauseImage),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Sauce',
                        style: gFontsOleo(cl: whiteColor, sz: 20),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          '₹ 10',
                          style: gFontsOleo(
                            cl: whiteColor,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: scafoldColor,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          const BottomWidget(
            iconColor: whiteColor,
            icon: Icons.favorite_outline,
            color: whiteColor,
            title: 'Add to WishList',
            backGroundColor: blackColor,
          ),
          BottomWidget(
            iconColor: blackColor,
            icon: Icons.room_service,
            color: blackColor,
            title: 'Buy now',
            backGroundColor: whiteColor.withOpacity(.9),
          ),
        ],
      ),
    );
  }
}
