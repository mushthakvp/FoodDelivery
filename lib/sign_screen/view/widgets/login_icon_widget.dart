import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/sign_screen/viewmodel/auth_pov.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class LoginAllIconWidget extends StatelessWidget {
  const LoginAllIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pov = context.read<AuthPov>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(
                  height: 1,
                  child: ColoredBox(color: greyColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Or connect Using',
                  style: gFontsOleo(
                    cl: greyColor,
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 1,
                  child: ColoredBox(color: greyColor),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const LoginIconWidgets(
                backgroundColor: facebookColor,
                icon: FontAwesomeIcons.facebookF,
              ),
              LoginIconWidgets(
                backgroundColor: whiteColor.withOpacity(.8),
                icon: FontAwesomeIcons.github,
                iconColor: blackColor,
              ),
              GestureDetector(
                onTap: () {
                  pov.googleSignin(context);
                },
                child: const LoginIconWidgets(
                  backgroundColor: googleColor,
                  icon: FontAwesomeIcons.google,
                ),
              ),
              const LoginIconWidgets(
                backgroundColor: mobileColor,
                icon: FontAwesomeIcons.mobileAlt,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LoginIconWidgets extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  const LoginIconWidgets({
    required this.backgroundColor,
    required this.icon,
    this.iconColor = whiteColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
