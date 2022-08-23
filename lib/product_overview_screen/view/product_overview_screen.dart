import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/cartscreen/view/cartscreen.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:provider/provider.dart';
import '../viewmodel/addon_provider.dart';
import '../viewmodel/product_overview_pov.dart';
import 'widget/addon_widget.dart';
import 'widget/all_info_widget.dart';
import 'widget/bottom_bar.dart';

class ProductOverviewScreen extends StatelessWidget {
  final HomeProductModel data;
  final String id;
  const ProductOverviewScreen({
    Key? key,
    required this.data,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparentColor,
        actions: [
          FavouriteButtonWidget(data: data, id: id),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
            splashRadius: 26,
          ),
          IconButton(
            onPressed: () {
              Routes.push(screen: const CartScreen());
            },
            icon: const Icon(Icons.shopping_cart),
            splashRadius: 26,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(data.productBackdrop),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: size.width,
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
                AddOnWidget(data: data),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(
              height: 60,
              color: cardColor,
              child: Consumer<AddOnProductPov>(builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        value.removeProductQuantity();
                      },
                      child: const CounterWidget(icon: Icons.remove),
                    ),
                    Text(
                      '${value.productQt}',
                      style: gFontsOleo(cl: whiteColor, sz: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.addProductQuantity();
                      },
                      child: const CounterWidget(icon: Icons.add),
                    ),
                  ],
                );
              }),
            ),
          ),
          BottomWidget(
            data : data,
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

class CounterWidget extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final double radius;
  const CounterWidget({
    this.iconSize = 20,
    this.radius = 23,
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: greyColor.withOpacity(.2),
      child: Icon(
        icon,
        color: whiteColor,
        size: iconSize,
      ),
    );
  }
}

class FavouriteButtonWidget extends StatelessWidget {
  const FavouriteButtonWidget({
    Key? key,
    required this.data,
    required this.id,
  }) : super(key: key);

  final HomeProductModel data;
  final String id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('whishList').where('productName', isEqualTo: data.productName).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return snapshot.hasData
            ? snapshot.data!.docs.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      ProductOverviewPov.deleteWhishlist(data.productName);
                    },
                    icon: const Icon(Icons.favorite, color: redColor),
                  )
                : IconButton(
                    onPressed: () {
                      ProductOverviewPov.addToWhishlist(data: data);
                    },
                    icon: const Icon(Icons.favorite_outline),
                  )
            : const SizedBox();
      },
    );
  }
}
