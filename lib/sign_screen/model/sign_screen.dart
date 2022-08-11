import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:food_delivery/core/styles/fonts.dart';
import 'package:food_delivery/sign_screen/viewmodel/auth_pov.dart';
import 'package:provider/provider.dart';
import '../../core/styles/images.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              height: size.height / 2,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Sign in to continue',
                    style: gFontsSans(ls: 1),
                  ),
                  Text(
                    'Food Bazar',
                    style: gFontsOleo(ls: 1, sz: 30, cl: whiteColor),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {
                          context.read<AuthPov>().googleSignin();
                        },
                      ),
                      SignInButton(
                        Buttons.Apple,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'By signing in you are agreeing to our',
                        style: gFontsSans(),
                      ),
                      Text(
                        'Terms and Privacy Policy',
                        style: gFontsSans(cl: whiteColor.withOpacity(.7), fw: FontWeight.w500),
                      ),
                    ],
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
