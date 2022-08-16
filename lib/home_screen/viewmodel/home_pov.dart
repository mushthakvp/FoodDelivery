import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class HomePov extends ChangeNotifier {
  final dbObj = FirebaseFirestore.instance.collection('HerbsProduct');
  HomePov() {
    vegPizaList();
    nonVegPizaList();
    //  withoutModelClass();
  }
  List<HomeProductModel> vegPiza = [];
  List<HomeProductModel> nonVegPiza = [];

  nonVegPizaList() async {
    nonVegPiza.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("nonVegPizza").get();
    final list = snapshot.docs.map((docSnapshot) => HomeProductModel.fromSnapshot(docSnapshot)).toList();
    nonVegPiza.addAll(list.reversed);
    notifyListeners();
  }

  vegPizaList() async {
    vegPiza.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("vegPiza").get();
    final list = snapshot.docs.map((docSnapshot) => HomeProductModel.fromSnapshot(docSnapshot)).toList();
    vegPiza.addAll(list.reversed);
    notifyListeners();
  }

  // withoutModelClass() async {
  //   freshProduct.clear();
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("HerbsProduct").get();
  //   for (var element in snapshot.docs) {
  //     final list = HomeProductModel(
  //       productName: element.get('productName'),
  //       productImage: element.get('productImage'),
  //       productPrice: element.get('productPrice'),
  //       productDetails: element.get('productDetails'),
  //       productRating: element.get('productRating'),
  //     );
  //     freshProduct.add(list);
  //   }
  //   log(freshProduct.length.toString());
  //   notifyListeners();
  // }
}
