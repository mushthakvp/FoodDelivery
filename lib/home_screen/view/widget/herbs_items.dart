import 'package:flutter/material.dart';
import 'package:food_delivery/core/styles/images.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';
import '../../../product_overview/view/product_overview_screen.dart';
import '../../../routes/routes.dart';

class HerbsItems extends StatelessWidget {
  const HerbsItems({
    Key? key,
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
                  basil,
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
                      'Fresh Basil',
                      style: gFontsOleo(
                        fw: FontWeight.bold,
                      ),
                    ),
                    const Text('50\$/50 Gram'),
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
