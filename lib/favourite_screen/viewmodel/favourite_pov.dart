  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/favourite_model.dart';

class FavouritePov extends ChangeNotifier {
  FavouritePov() {
    nonVegPizaList();
  }

  List<FavouriteModel> favouriteList = [];

  nonVegPizaList() async {
    favouriteList.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("nonVegPizza").get();
    final list = snapshot.docs.map((docSnapshot) => FavouriteModel.fromSnapshot(docSnapshot)).toList();
    favouriteList.addAll(list.reversed);
    notifyListeners();
  }
}
