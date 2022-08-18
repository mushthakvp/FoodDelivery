import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/splash_screen/viewmodel/splash_pov.dart';
import '../model/favourite_model.dart';

class FavouritePov extends ChangeNotifier {
  final vegCollection = FirebaseFirestore.instance.collection('userDetails').doc(SplashPov.email).collection('whishList');

  List<FavouriteModel> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<FavouriteModel> newlist = snapshot.data!.docs.map((convert) {
        return FavouriteModel.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      newlist = newlist.reversed.toList();
      return newlist;
    } else {
      return [];
    }
  }
}
