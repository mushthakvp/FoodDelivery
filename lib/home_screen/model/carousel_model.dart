import 'package:cloud_firestore/cloud_firestore.dart';

class HomeCarouselModel {
  String productImage;
  HomeCarouselModel({required this.productImage});

  factory HomeCarouselModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return HomeCarouselModel(
      productImage: snapshot["productImage"],
    );
  }

  Map<String, dynamic> toSnapshot() {
    return {"productImage": productImage};
  }
}
