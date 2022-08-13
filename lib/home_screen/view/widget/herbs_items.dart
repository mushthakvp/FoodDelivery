import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/styles/images.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../product_overview_screen/view/product_overview_screen.dart';
import '../../../routes/routes.dart';

class HerbsItems extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> dataNew;
  const HerbsItems({
    Key? key,
    required this.dataNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routes.push(
          screen: ProductOverviewScreen(image: basil),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 220,
        width: 160,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Image.network(
                  dataNew['productImage'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      dataNew['productName'],
                      style: gFontsOleo(
                        fw: FontWeight.bold,
                      ),
                    ),
                    Text('\$ ${dataNew['productPrice']} / 1KG'),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
