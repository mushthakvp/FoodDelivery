import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../home_screen/model/home_model.dart';

class ProductOverviewPov {
  static addToWhishlist({required HomeProductModel data, required String id, required bool fav}) {
    final favData = HomeProductModel(
      productPrice: data.productPrice,
      productOffer: data.productOffer,
      productRating: data.productRating,
      productName: data.productName,
      productDetails: data.productDetails,
      productImage: data.productImage,
      productBackdrop: data.productBackdrop,
      productAddedFavourite: fav,
      productShop: data.productShop,
      productCategory: data.productCategory,
    );
    FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('whishList').doc(data.productName).set(favData.toSnapshot());
  }
}
