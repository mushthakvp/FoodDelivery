import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import '../../core/styles/images.dart';

class OauthScreen extends StatelessWidget {
  const OauthScreen({Key? key}) : super(key: key);

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
                children: [
                  Text(
                    'Sign in to continue',
                    style: gFontsSans(ls: 1),
                  ),
                  Text(
                    'Sign in to continue',
                    style: gFontsOleo(ls: 1, sz: 20),
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
