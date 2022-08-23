import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../model/bag_models.dart';

class AddToBagPov extends ChangeNotifier {
  final collectionData = FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('cartList');
  List<BagModels> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<BagModels> newlist = snapshot.data!.docs.map((convert) {
        return BagModels.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();
      newlist = newlist.reversed.toList();
      return newlist;
    } else {
      return [];
    }
  }
}
