import 'package:flutter/cupertino.dart';

class HomeBottomNavBar extends ChangeNotifier {
  int bottomIndex = 0;

  changeBottomIndex({required int bottomIndex}) {
    this.bottomIndex = bottomIndex;
    notifyListeners();
    
  }
}
