import 'package:flutter/material.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.icon,
    required this.info,
    required this.time,
  }) : super(key: key);
  final String time;
  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Icon(
          (icon),
          color: yellowColor,
          size: 20,
        ),
        const SizedBox(height: 10),
        Text(
          time,
          style: gFontsOleo(
            cl: whiteColor.withOpacity(.7),
            sz: 14,
          ),
        ),
        Text(
          info,
          style: gFontsOleo(
            cl: greyColor,
            sz: 12,
          ),
        )
      ],
    );
  }
}
