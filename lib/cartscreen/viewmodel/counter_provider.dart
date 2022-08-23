import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../model/bag_models.dart';

class CounterPov extends ChangeNotifier {
  // add product quantity

  removeProductQuantity(BagModels data) async {
    if (data.productCount > 1) {
      final dmData = BagModels(
        productCount: data.productCount--,
        productPrice: data.productPrice,
        productOffer: data.productOffer,
        productRating: data.productRating,
        productName: data.productName,
        productDetails: data.productDetails,
        productImage: data.productImage,
        productBackdrop: data.productBackdrop,
        productShop: data.productShop,
        productCategory: data.productCategory,
      );
      await FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('cartList').doc(data.productName).set(dmData.toSnapshot());
      Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    }
  }

  addProductQuantity(BagModels data) async {
    if (data.productCount < 5) {
      final dmData = BagModels(
        productCount: data.productCount++,
        productPrice: data.productPrice,
        productOffer: data.productOffer,
        productRating: data.productRating,
        productName: data.productName,
        productDetails: data.productDetails,
        productImage: data.productImage,
        productBackdrop: data.productBackdrop,
        productShop: data.productShop,
        productCategory: data.productCategory,
      );
      await FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('cartList').doc(data.productName).set(dmData.toSnapshot());
      Future.delayed(const Duration(seconds: 1));
      notifyListeners();
    }
  }
}
