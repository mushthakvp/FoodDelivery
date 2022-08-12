import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view/widget/carousel_widget.dart';
import 'package:food_delivery/home_screen/view/widget/fresh_fruit_items.dart';
import 'package:food_delivery/home_screen/view/widget/herbs_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldColor,
      drawer: Drawer(
        child: Container(
          color: blackColor,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 43,
                      child: CircleAvatar(
                        backgroundColor: blackColor,
                        radius: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
          CircleAvatar(
            backgroundColor: whiteColor.withOpacity(.3),
            child: const Icon(
              Icons.shopping_cart,
              size: 20,
              color: whiteColor,
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, index) {
                return const HerbsItems();
              },
            ),
          ),
          const ViewAllWidget(name: 'Fresh Fruits'),
          LimitedBox(
            maxHeight: 220,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 30,
              itemBuilder: (context, index) {
                return const FreshFruitItems();
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
