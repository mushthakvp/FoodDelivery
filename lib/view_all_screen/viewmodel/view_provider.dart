import 'package:flutter/cupertino.dart';

class ViewAllPov extends ChangeNotifier {
  //search field controller

  final searchController = TextEditingController();
  //search button

  bool searchValue = true;

  searchValueChange(bool searchValue) {
    this.searchValue = searchValue;
    notifyListeners();
  }

  //text field values

  String searchValues = '';
  bool searchValueChecking = false;

  changeSearchValues(String searchValues) {
    this.searchValues = searchValues.trim();
    if (searchController.text.trim().isEmpty) {
      searchValueChecking = false;
    } else {
      searchValueChecking = true;
    }
    notifyListeners();
  }

  // app bar leading

  appLeadingTap() {
    if (searchValues.trim().isEmpty) {
      searchValueChange(true);
    } else {
      searchValueChecking = false;
      searchValues = '';
      searchController.clear();
    }
    notifyListeners();
  }
}
