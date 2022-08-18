import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/splash_screen/viewmodel/splash_pov.dart';
import '../../home_screen/model/home_model.dart';

class ProductOverviewPov extends ChangeNotifier {
  addToWhishlist({required HomeProductModel data, required BuildContext context}) {
    FirebaseFirestore.instance
        .collection('userDetails')
        .doc(
          SplashPov.email,
        )
        .collection('whishList')
        .add(
          data.toSnapshot(),
        );
  }
}
