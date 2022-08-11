import 'package:flutter/material.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class FreshFruitItems extends StatelessWidget {
  const FreshFruitItems({
    Key? key,
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
                'https://purepng.com/public/uploads/large/purepng.com-pear-fruitspearorganicripehealthyfruit-981524676238afsvd.png',
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
