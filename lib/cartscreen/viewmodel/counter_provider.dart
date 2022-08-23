import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import '../model/bag_models.dart';

class CounterPov extends ChangeNotifier {
  // add product quantity

  removeProductQuantity(BagModels data, BuildContext context) async {
    if (data.productCount > 1) {
      showDialog(
        context: context,
        builder: (context) {
          return const SimpleDialog(
            children: [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          );
        },
      );
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
      await FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('cartList').doc(data.productName).set(dmData.toSnapshot()).then((value) {
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: redColor,
            content: Text('Try again'),
          ),
        );
      });
      notifyListeners();
    }
  }

  void addProductQuantity(BagModels data, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const SimpleDialog(
          children: [
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
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
      await FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('cartList').doc(data.productName).set(dmData.toSnapshot()).then((value) {
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: redColor,
            content: Text('Try again'),
          ),
        );
      });

      notifyListeners();
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: redColor,
          content: Text('Maximum limit exceed'),
        ),
      );
    }
  }
}
