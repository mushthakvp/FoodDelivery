import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class HomePov extends ChangeNotifier {
  final dbObj = FirebaseFirestore.instance.collection('HerbsProduct');
  HomePov() {
    getAllLists();
    withoutModelClass();
  }

  List<HomeProductModel> herbsProduct = [];
  List<HomeProductModel> freshProduct = [];

  getAllLists() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("HerbsProduct").get();
    final list = snapshot.docs.map((docSnapshot) => HomeProductModel.fromSnapshot(docSnapshot)).toList();
    herbsProduct.addAll(list);
    notifyListeners();
  }

  withoutModelClass() async {
    freshProduct.clear();
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("HerbsProduct").get();
    for (var element in snapshot.docs) {
      final list = HomeProductModel(
        productName: element.get('productName'),
        productImage: element.get('productImage'),
        productPrice: element.get('productPrice'),
      );
      freshProduct.add(list);
    }
    log(freshProduct.length.toString());
    notifyListeners();
  }
}
