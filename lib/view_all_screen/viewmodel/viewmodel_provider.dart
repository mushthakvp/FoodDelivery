import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/view_all_model.dart';

class ViewAllModelPov {

  List<ViewAllProductModel> searchResult = [];
  bool initSearching = true;

  static List<ViewAllProductModel> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<ViewAllProductModel> newlist = snapshot.data!.docs.map((convert) {
        return ViewAllProductModel.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      newlist = newlist.reversed.toList();
      return newlist;
    } else {
      return [];
    }
  }
}
