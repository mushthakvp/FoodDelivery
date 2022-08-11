import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.all(10),
      height: 220,
      width: 160,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: InkWell(
              onTap: () {
                Routes.push(
                  screen: const ProductOverviewScreen(),
                );
              },
              child: Center(
                child: Image.network(
                  'https://assets.stickpng.com/images/58bf1e2ae443f41d77c734ab.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 29,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: greyColor),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                '50 Gram',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 29,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: greyColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.remove, size: 14),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                              Icon(Icons.add, size: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
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
