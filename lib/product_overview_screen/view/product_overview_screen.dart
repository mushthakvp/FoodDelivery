import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import '../viewmodel/product_overview_pov.dart';
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
        backgroundColor: blackColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
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
          Hero(
            tag: data.productImage,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: size.width,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(data.productImage),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh Basil',
                  style: gFontsOleo(sz: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$50 MRP', style: gFontsOleo(sz: 20)),
                    Text('50 KG left in Stock', style: gFontsOleo(sz: 20)),
                  ],
                ),
                LimitedBox(
                  maxHeight: 60,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: ProductOverviewPov.quantity.length,
                    itemBuilder: (context, index) {
                      final data = ProductOverviewPov.quantity[index];
                      return ItemQuantity(data: data);
                    },
                  ),
                ),
                Text(
                  'Description',
                  style: gFontsOleo(sz: 20, cl: greyColor),
                ),
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
            icon: Icons.shopping_bag_outlined,
            color: blackColor,
            title: 'Buy now',
            backGroundColor: whiteColor,
          ),
        ],
      ),
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
