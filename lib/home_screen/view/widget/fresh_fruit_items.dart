import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class FreshFruitItems extends StatelessWidget {
  final HomeProductModel data;
  const FreshFruitItems({
    Key? key, required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
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
                data.productImage,
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
                    'Fresh Fruit',
                    style: gFontsOleo(
                      fw: FontWeight.bold,
                    ),
                  ),
                  const Text('50\$/5 Kg'),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
