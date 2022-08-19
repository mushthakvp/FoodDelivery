import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../home_screen/model/home_model.dart';

class ProductOverviewPov extends ChangeNotifier {
  addToWhishlist({
    required HomeProductModel data,
    required BuildContext context,
    required String collection,
    required String id,
  }) {
    FirebaseFirestore.instance.collection(collection).doc(id).update(data.toSnapshot());
    FirebaseFirestore.instance
        .collection('userDetails')
        .doc(
          FirebaseAuth.instance.currentUser!.email,
        )
        .collection('whishList')
        .add(
          data.toSnapshot(),
        );
  }
}
