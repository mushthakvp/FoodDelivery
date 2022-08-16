import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/home_screen/view/widget/home_screenitems.dart';
import 'package:food_delivery/home_screen/viewmodel/home_pov.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<HomePov>();
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        title: Text(
          'Whishlist',
          style: gFontsOleo(cl: whiteColor, sz: 20),
        ),
        elevation: 0,
        backgroundColor: cardColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          childAspectRatio: 1 / 1.5,
          children: List.generate(pov.vegPiza.length, (index) {
            final data = pov.vegPiza[index];
            return HomeScreenItemsCard(data: data);
          }),
        ),
      ),
    );
  }
}
