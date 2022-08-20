import 'package:cloud_firestore/cloud_firestore.dart';

class SearchModelItems {
  String productName;
  String productImage;
  String productBackdrop;
  int productPrice;
  String productDetails;
  String productShop;
  num productOffer;
  num productRating;
  bool productAddedFavourite;
  String productCategory;
  SearchModelItems({
    required this.productPrice,
    required this.productOffer,
    required this.productRating,
    required this.productName,
    required this.productDetails,
    required this.productImage,
    required this.productBackdrop,
    required this.productAddedFavourite,
    required this.productShop,
    required this.productCategory,
  });

  factory SearchModelItems.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return SearchModelItems(
      productCategory: snapshot["productCategory"],
      productAddedFavourite: snapshot["productAddedFavourite"],
      productShop: snapshot["productShop"],
      productName: snapshot["productName"],
      productOffer: snapshot["productOffer"],
      productRating: snapshot["productRating"],
      productImage: snapshot["productImage"],
      productPrice: snapshot["productPrice"],
      productDetails: snapshot["productDetails"],
      productBackdrop: snapshot["productBackdrop"],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {
      "productCategory": productCategory,
      "productAddedFavourite": productAddedFavourite,
      "productBackdrop": productBackdrop,
      "productShop": productShop,
      "productName": productName,
      "productOffer": productOffer,
      "productRating": productRating,
      "productImage": productImage,
      "productPrice": productPrice,
      "productDetails": productDetails,
    };
  }
}
