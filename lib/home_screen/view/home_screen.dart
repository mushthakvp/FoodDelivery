import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/favourite_screen/view/favourite_screen.dart';
import 'package:food_delivery/home_screen/view/widget/non_veg_piza_widget.dart';
import 'package:food_delivery/routes/routes.dart';
import 'widget/carousel_widget.dart';
import 'widget/veg_piza_widget.dart';
import 'widget/view_all_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        title: Text(
          'Pizza Pedler',
          style: gFontsOleo(cl: whiteColor, sz: 20, fw: FontWeight.w500, ls: 1),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_on_outlined),
            splashRadius: 25,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            splashRadius: 25,
          ),
          IconButton(
            onPressed: () {
              Routes.push(screen: const FavouriteScreen());
            },
            icon: const Icon(Icons.favorite_outline),
            splashRadius: 25,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          Carouselwidget(),
          ViewAllWidget(name: 'Non - Veg Pizza'),
          SizedBox(height: 10),
          NonVegPizaWidget(),
          ViewAllWidget(name: 'Vegetarian Pizza'),
          SizedBox(height: 10),
          VegPizaWidget(),
        ],
      ),
    );
  }
}
