import 'package:flutter/material.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static push({required var screen}) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushreplace({required var screen}) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}
