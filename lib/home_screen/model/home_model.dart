import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProductModel {
  String productName;
  String productImage;
  int productPrice;
  String productDetails;
  num productRating;
  HomeProductModel({
    required this.productRating,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDetails,
  });

  factory HomeProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return HomeProductModel(
      productName: snapshot["productName"],
      productRating: snapshot["productRating"],
      productImage: snapshot["productImage"],
      productPrice: snapshot["productPrice"],
      productDetails: snapshot["productDetails"],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {
      "productName": productName,
      "productRating": productRating,
      "productImage": productImage,
      "productPrice": productPrice,
      "productDetails": productDetails,
    };
  }
}
