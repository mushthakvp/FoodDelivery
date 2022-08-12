import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final Color color;
  final Color backGroundColor;
  final String title;
  const BottomWidget({
    Key? key,
    required this.iconColor,
    required this.icon,
    required this.color,
    required this.title,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        color: backGroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
