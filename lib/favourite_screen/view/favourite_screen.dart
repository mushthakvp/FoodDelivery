import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:provider/provider.dart';
import '../../home_screen/model/home_model.dart';
import '../viewmodel/favourite_pov.dart';
import 'widgets/listview.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<FavouritePov>();
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
        child: StreamBuilder(
          stream: pov.vegCollection.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            List<HomeProductModel> list = pov.convertToList(streamSnapshot);
            return list.isNotEmpty
                ? GridView.count(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    childAspectRatio: 1 / 1.40,
                    children: List.generate(
                      list.length,
                      (index) {
                        final id = streamSnapshot.data!.docs[index];
                        final data = list[index];
                        return FavouriteListView(data: data, id: id.id);
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
