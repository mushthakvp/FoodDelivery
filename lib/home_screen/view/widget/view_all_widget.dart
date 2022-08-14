import 'package:flutter/material.dart';
import '../../../core/color/colors.dart';
import '../../../core/styles/fonts.dart';

class ViewAllWidget extends StatelessWidget {
  final String name;
  const ViewAllWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: gFontsOleo(cl: whiteColor, fw: FontWeight.bold, ls: 1),
          ),
          Text(
            'VIEW ALL',
            style: gFontsOleo(cl: greyColor, sz: 14),
          ),
        ],
      ),
    );
  }
}
