import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
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
                const SizedBox(height: 8),
                const SizedBox(width: 40, child: Divider(color: whiteColor, thickness: 2)),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    data.productName,
                    textAlign: TextAlign.center,
                    style: gFontsOleo(cl: whiteColor, sz: 25, fw: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    InfoWidget(
                      icon: Icons.schedule,
                      info: 'Cooking',
                      time: '40 Minute',
                    ),
                    InfoWidget(
                      icon: Icons.star,
                      info: '4.08',
                      time: 'Ratings',
                    ),
                    InfoWidget(
                      icon: Icons.pending,
                      info: 'Cooking',
                      time: '40 Minute',
                    ),
                  ],
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

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.icon,
    required this.info,
    required this.time,
  }) : super(key: key);
  final String time;
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Icon(
          (icon),
          color: primaryColor,
          size: 25,
        ),
        const SizedBox(height: 10),
        Text(
          time,
          style: gFontsOleo(
            cl: whiteColor.withOpacity(.7),
            sz: 14,
          ),
        ),
        Text(
          info,
          style: gFontsOleo(
            cl: greyColor,
            sz: 12,
          ),
        )
      ],
    );
  }
}

class ItemQuantity extends StatelessWidget {
  final dynamic data;
  const ItemQuantity({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
      padding: const EdgeInsets.all(6),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: blackColor),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            data,
            style: gFontsOleo(sz: 12),
          ),
        ),
      ),
    );
  }
}
