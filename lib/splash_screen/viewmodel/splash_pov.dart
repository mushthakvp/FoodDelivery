import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home_screen/view/home_screen.dart';
import '../../routes/routes.dart';
import '../../sign_screen/view/sign_screen.dart';

class SplashPov extends ChangeNotifier {
  SplashPov() {
    checkUserLogin();
  }

  void checkUserLogin() async {
    final obj = await SharedPreferences.getInstance();
    bool data = obj.getBool('userLoged') ?? false;

    Timer(
      const Duration(seconds: 2),
      () => data
          ? Routes.pushreplace(
              screen: const HomeScreen(),
            )
          : Routes.pushreplace(
              screen: const SignScreen(),
            ),
    );
  }
}
