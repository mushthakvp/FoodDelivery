import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/search_model.dart';

class ViewAllPov extends ChangeNotifier {
  ViewAllPov() {
    searchListFetchData();
  }
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
      initSearching = true;
      searchResult.clear();
      searchValueChecking = false;
      searchValues = '';
      searchController.clear();
    }
    notifyListeners();
  }

  // serch

  List<SearchModelItems> searchResult = [];
  List<SearchModelItems> allResultData = [];

  bool initSearching = true;

  searchListFetchData() async {
    allResultData.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("nonVegPizza").get();
    final list = snapshot.docs.map((docSnapshot) => SearchModelItems.fromSnapshot(docSnapshot)).toList();
    allResultData.addAll(list.reversed);
    notifyListeners();
  }

  searchFilter({required String query, required BuildContext context}) {
    initSearching = false;
    if (query.isEmpty) {
      searchResult = allResultData;
    } else {
      searchResult = allResultData
          .where(
            (element) => element.productName.toLowerCase().contains(
                  query.toLowerCase().trim(),
                ),
          )
          .toList();
    }
  }
}
