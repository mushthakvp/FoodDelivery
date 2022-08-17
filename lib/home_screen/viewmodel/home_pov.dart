import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class HomePov extends ChangeNotifier {
  final nonVegCollection = FirebaseFirestore.instance.collection('nonVegPizza');
  final vegCollection = FirebaseFirestore.instance.collection('vegPiza');

  List<HomeProductModel> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<HomeProductModel> newlist = snapshot.data!.docs.map((convert) {
        return HomeProductModel.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      newlist = newlist.reversed.toList();
      return newlist;
    } else {
      return [];
    }
  }
}
