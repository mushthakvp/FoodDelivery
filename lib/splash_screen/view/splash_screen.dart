import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';

import '../../core/styles/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              secondaryColor,
              primaryColor,
            ],
          ),
          image: DecorationImage(
            image: AssetImage(
              backGrounImage,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                children: const [Text('Sign in to continue')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
