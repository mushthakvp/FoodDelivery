import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import 'package:food_delivery/product_overview_screen/viewmodel/product_overview_pov.dart';
import 'package:provider/provider.dart';
import '../viewmodel/addon_provider.dart';
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
            onPressed: () {},
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
    return Consumer<AddOnProductPov>(builder: (context, value, _) {
      return value.favButton
          ? IconButton(
              splashRadius: 26,
              onPressed: () {
                ProductOverviewPov.addToWhishlist(
                  data: data,
                  id: id,
                  fav: false,
                );
                value.favButtonChange(favButton: false);
              },
              icon: const Icon(Icons.favorite, color: redColor),
            )
          : IconButton(
              onPressed: () {
                ProductOverviewPov.addToWhishlist(
                  data: data,
                  id: id,
                  fav: true,
                );
                value.favButtonChange(favButton: true);
              },
              icon: const Icon(Icons.favorite_outline),
              splashRadius: 26,
            );
    });
  }
}
