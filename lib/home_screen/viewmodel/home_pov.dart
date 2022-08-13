import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/home_screen/model/home_model.dart';

class HomePov extends ChangeNotifier {

  HomePov(){
    fetchHerbsProduct();
  }

  List<HomeProductModel> herbsProduct = [];

  fetchHerbsProduct() async {
   QuerySnapshot value = await FirebaseFirestore.instance.collection('HerbsProduct').get();

   value.docs.forEach((element) {
    print(element.data());
    });
  }
}
