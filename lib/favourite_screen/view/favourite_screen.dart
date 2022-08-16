import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/favourite_screen/viewmodel/favourite_pov.dart';
import 'package:provider/provider.dart';

import 'widgets/listview.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Consumer<FavouritePov>(builder: (context, value, _) {
          return value.favouriteList.isNotEmpty
              ? GridView.count(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1 / 1.5,
                  children: List.generate(value.favouriteList.length, (index) {
                    final data = value.favouriteList[index];
                    return FavouriteListView(data: data);
                  }),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
    );
  }
}
