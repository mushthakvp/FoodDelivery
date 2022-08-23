import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/cartscreen/view/widget/bagitemswidget.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:provider/provider.dart';
import '../model/bag_models.dart';
import '../viewmodel/bag_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<AddToBagPov>();
    return Scaffold(
      backgroundColor: scafoldColor,
      appBar: AppBar(
        backgroundColor: cardColor,
      ),
      body: StreamBuilder(
          stream: pov.collectionData.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            List<BagModels> list = pov.convertToList(streamSnapshot);
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final data = list[index];
                return BagItemsWidget(data: data);
              },
            );
          }),
    );
  }
}
