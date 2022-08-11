import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/splash_screen/viewmodel/splash_pov.dart';
import 'package:provider/provider.dart';
import '../../core/styles/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashPov>(
      builder: (context, value, child) => Scaffold(
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
        ),
      ),
    );
  }
}
