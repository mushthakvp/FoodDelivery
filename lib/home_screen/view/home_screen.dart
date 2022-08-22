import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/favourite_screen/view/favourite_screen.dart';
import 'package:food_delivery/home_screen/view/widget/non_veg_piza_widget.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:provider/provider.dart';
import '../viewmodel/bottom_barprovider.dart';
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
          ViewAllWidget(name: 'Non - Veg Pizza', collection: 'nonVegPizza'),
          SizedBox(height: 10),
          NonVegPizaWidget(),
          ViewAllWidget(name: 'Vegetarian Pizza', collection: 'vegPiza'),
          SizedBox(height: 10),
          VegPizaWidget(),
        ],
      ),
      bottomNavigationBar: Consumer<HomeBottomNavBar>(builder: (context, value, _) {
        return FlashyTabBar(
          backgroundColor: cardColor,
          selectedIndex: value.bottomIndex,
          showElevation: true,
          onItemSelected: (index) {
            value.changeBottomIndex(bottomIndex: index);
          },
          items: [
            FlashyTabBarItem(
              icon: const Icon(Icons.event),
              title: const Text('Events'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.search),
              title: const Text('Search'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.highlight),
              title: const Text('Highlights'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('한국어'),
            ),
          ],
        );
      }),
    );
  }
}
