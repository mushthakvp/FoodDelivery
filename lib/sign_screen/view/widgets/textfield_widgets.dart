import 'package:flutter/material.dart';
import '../../../core/color/colors.dart';

class TextfieldWidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  const TextfieldWidget({
    required this.hint,
    required this.controller,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          height: 1.3,
          color: Colors.white,
          letterSpacing: .8,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: 'email',
          hintStyle: TextStyle(
            color: greyColor.withOpacity(.8),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
