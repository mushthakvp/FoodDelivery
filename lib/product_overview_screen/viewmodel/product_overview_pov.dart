import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../home_screen/model/home_model.dart';

class ProductOverviewPov {
  static addToWhishlist({required HomeProductModel data}) {
    final favData = HomeProductModel(
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
    FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('whishList').doc(data.productName).set(favData.toSnapshot());
  }

  static deleteWhishlist(String name) {
    FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('whishList').doc(name).delete();
  }

  static addCartItems({required HomeProductModel data}) {
    FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('cartList').doc(data.productName).set(data.toSnapshot());
  }
}
