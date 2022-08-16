import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';

import 'widgets/login_items_widget.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scafoldColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.width / 4.5),
            Center(
              child: CircleAvatar(
                backgroundColor: cardColor.withOpacity(.4),
                radius: 80,
                backgroundImage: const AssetImage('assets/images/BG1.png'),
              ),
            ),
            SizedBox(height: size.width / 6),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              height: size.width * 1.14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: cardColor,
              ),
              child: LoginInfiItemsWidget(size: size),
            ),
          ],
        ),
      ),
    );
  }
}
