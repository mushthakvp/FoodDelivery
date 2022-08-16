import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/splash_screen/viewmodel/splash_pov.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashPov>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: scafoldColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 135),
                  Center(
                    child: Image.asset(
                      'assets/images/BG1.png',
                      height: 200,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text('from', style: gFontsOleo(cl: greyColor, sz: 10)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'FOUV',
                            style: gFontsOleo(
                              cl: whiteColor,
                              ls: 2,
                              fw: FontWeight.bold,
                              sz: 14,
                            )),
                        TextSpan(
                          text: 'TY',
                          style: gFontsOleo(
                            cl: greenColor,
                            ls: 2,
                            fw: FontWeight.bold,
                            sz: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
