class HomeProductModel {
  String? productName;
  String? productImage;
  int? productPrice;
  HomeProductModel({this.productName, this.productImage, this.productPrice});

  factory HomeProductModel.fromJson(Map<String, dynamic> json) => HomeProductModel(
        productName: json["productName"],
        productImage: json["productImage"],
        productPrice: json["productPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
      };
}
