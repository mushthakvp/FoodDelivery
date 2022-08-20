import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class FavouritePov extends ChangeNotifier {
  final vegCollection = FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('whishList');

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

  deleteFavourite({required String id}) {
    FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('whishList').doc(id).delete();
  }
}
