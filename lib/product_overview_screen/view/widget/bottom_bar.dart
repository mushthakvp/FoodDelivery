import 'package:flutter/material.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

import '../../viewmodel/product_overview_pov.dart';

class BottomWidget extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final Color color;
  final Color backGroundColor;
  final String title;
  final HomeProductModel data;
  const BottomWidget({
    Key? key,
    required this.iconColor,
    required this.icon,
    required this.color,
    required this.title,
    required this.backGroundColor,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ProductOverviewPov.addCartItems(data: data);
        },
        child: Container(
          height: 60,
          color: backGroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
