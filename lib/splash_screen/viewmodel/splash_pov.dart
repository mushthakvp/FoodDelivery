import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../routes/routes.dart';
import '../../sign_screen/model/sign_screen.dart';

class SplashPov extends ChangeNotifier {
  SplashPov() {
    Timer(
      const Duration(seconds: 2),
      () => Routes.push(
        screen: const SignScreen(),
      ),
    );
  }
}
