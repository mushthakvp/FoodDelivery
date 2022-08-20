import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class HomePov extends ChangeNotifier {
  final nonVegCollection = FirebaseFirestore.instance.collection('nonVegPizza');
  final vegCollection = FirebaseFirestore.instance.collection('vegPiza');

  List<HomeProductModel> getAllProducts = [];

  List<HomeProductModel> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    getAllProducts.clear();

    if (snapshot.hasData) {
      List<HomeProductModel> newlist = snapshot.data!.docs.map((convert) {
        return HomeProductModel.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      newlist = newlist.reversed.toList();
      getAllProducts.addAll(newlist);
      return newlist;
    } else {
      return [];
    }
  }

  List<HomeProductModel> convertToListVeg(AsyncSnapshot<QuerySnapshot> snapshot) {
    getAllProducts.clear();

    if (snapshot.hasData) {
      List<HomeProductModel> newlist = snapshot.data!.docs.map((convert) {
        return HomeProductModel.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      newlist = newlist.reversed.toList();
      getAllProducts.addAll(newlist);
      return newlist;
    } else {
      return [];
    }
  }
}
