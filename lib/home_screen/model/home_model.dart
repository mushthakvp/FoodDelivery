import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProductModel {
  String productName;  
  String productImage;
  int productPrice;
  HomeProductModel({
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  factory HomeProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return HomeProductModel(
      productName: snapshot["productName"],
      productImage: snapshot["productImage"],
      productPrice: snapshot["productPrice"],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {
      "productName": productName,
      "productImage": productImage,
      "productPrice": productPrice,
    };
  }
}
