import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class HomePov extends ChangeNotifier {
  final dbObj = FirebaseFirestore.instance.collection('HerbsProduct');
  HomePov() {
    getAllLists();
  }

  List<HomeProductModel> herbsProduct = [];

  getAllLists() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("HerbsProduct").get();
    final list = snapshot.docs.map((docSnapshot) => HomeProductModel.fromSnapshot(docSnapshot)).toList();
    herbsProduct.addAll(list);
    notifyListeners();
  }
}
