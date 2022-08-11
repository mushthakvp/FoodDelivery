import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery/auth_screen/model/auth_screen.dart';

import '../../routes/routes.dart';

class SplashPov extends ChangeNotifier {
  SplashPov() {
    Timer(
      const Duration(seconds: 2),
      () => Routes.push(
        screen: const OauthScreen(),
      ),
    );
  }
}
