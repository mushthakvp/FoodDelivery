import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../model/carousel_model.dart';

class HomeCarouselPov extends ChangeNotifier {
  HomeCarouselPov() {
    getAllLists();
  }

  List<HomeCarouselModel> carouselList = [];

  getAllLists() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("BackgroundImage").get();
    final list = snapshot.docs.map((docSnapshot) => HomeCarouselModel.fromSnapshot(docSnapshot)).toList();
    carouselList.addAll(list);
    carouselList.shuffle();
    notifyListeners();
  }
}
