import 'package:flutter/cupertino.dart';

class ViewAllPov extends ChangeNotifier {
  //search button

  bool searchValue = true;

  searchValueChange(bool searchValue) {
    this.searchValue = searchValue;
    notifyListeners();
  }
}
