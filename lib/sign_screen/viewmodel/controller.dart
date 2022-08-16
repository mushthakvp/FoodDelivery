import 'package:flutter/cupertino.dart';

class Controller {
  static final mailController = TextEditingController();
  static final numberController = TextEditingController();
  static final passwordController = TextEditingController();

  static void disposeController() {
    mailController.clear();
    numberController.clear();
    passwordController.clear();
  }
}
