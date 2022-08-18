class WhishListModel {
  String productName;
  String productImage;
  String productBackdrop;
  int productPrice;
  String productDetails;
  String productShop;
  num productOffer;
  num productRating;

  WhishListModel({
    required this.productPrice,
    required this.productOffer,
    required this.productRating,
    required this.productName,
    required this.productDetails,
    required this.productImage,
    required this.productBackdrop,
    required this.productShop,
  });

  Map<String, dynamic> toSnapshot() {
    return {
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
