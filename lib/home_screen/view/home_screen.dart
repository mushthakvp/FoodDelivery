import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/cart_screen/model/cart_screen.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view/widget/carousel_widget.dart';
import 'package:food_delivery/home_screen/view/widget/fresh_fruit_items.dart';
import 'package:food_delivery/home_screen/view/widget/herbs_items.dart';
import 'package:food_delivery/home_screen/viewmodel/home_pov.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:provider/provider.dart';
import 'widget/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<HomePov>();
    return Scaffold(
      backgroundColor: scafoldColor,
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        backgroundColor: blackColor,
        title: const Text('Home'),
        actions: [
          CircleAvatar(
            backgroundColor: whiteColor.withOpacity(.3),
            child: const Icon(
              Icons.search,
              size: 20,
              color: whiteColor,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Routes.push(screen: const CartScreen());
            },
            child: CircleAvatar(
              backgroundColor: whiteColor.withOpacity(.3),
              child: const Icon(
                Icons.shopping_cart,
                size: 20,
                color: whiteColor,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const CarouselWidget(),
          const ViewAllWidget(name: 'Herbs Seasonings'),
          LimitedBox(
            maxHeight: 220,
            child: StreamBuilder(
              stream: pov.dbObj.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          final dataNew = snapshot.data!.docs[index];
                          return HerbsItems(dataNew: dataNew);
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          const ViewAllWidget(name: 'Fresh Fruits'),
          LimitedBox(
            maxHeight: 220,
            child: Consumer<HomePov>(
              builder: (context, value, child) {
                return value.herbsProduct.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.herbsProduct.length,
                        itemBuilder: (context, index) {
                          final data = value.herbsProduct[index];
                          
                          return  FreshFruitItems(data : data);
                        },
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ViewAllWidget extends StatelessWidget {
  final String name;
  const ViewAllWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: gFontsOleo(),
          ),
          Text(
            'view all',
            style: gFontsOleo(cl: greyColor),
          ),
        ],
      ),
    );
  }
}
