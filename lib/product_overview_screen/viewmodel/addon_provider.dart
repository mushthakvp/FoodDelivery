import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';
import '../../view_all_screen/model/search_model.dart';

class AddOnProductPov extends ChangeNotifier {
  Color buttonColor = scafoldColor;
  bool changeValue = false;

  buttonColorChange(bool value, BuildContext context) {
    changeValue = value;
    if (value == true) {
      buttonColor = Colors.green;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      buttonColor = scafoldColor;
    }
    notifyListeners();
  }

  // favourite button

  bool favButton = false;

  favButtonChange({required bool favButton}) {
    this.favButton = favButton;
    notifyListeners();
  }

  //snack bar

  var snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Add on',
      message: 'One sauce added to your plate',
      contentType: ContentType.success,
    ),
  );

  //calculate offer prize

  String offerCalculating({required double offerPrice, required double amount}) {
    double finalAmount = (offerPrice / amount) * 100;
    double percent = 100 - finalAmount;
    return percent.toStringAsFixed(2);
  }

  // checking favourite

  List<SearchModelItems> allResultData = [];

  favouriteListFetchData() async {
    allResultData.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('userDetails').doc(FirebaseAuth.instance.currentUser!.email).collection('whishList').get();
    final list = snapshot.docs.map((docSnapshot) => SearchModelItems.fromSnapshot(docSnapshot)).toList();
    allResultData.addAll(list.reversed);
    notifyListeners();
  }

  // add product quantity

  int productQt = 1;

  removeProductQuantity() {
    if (productQt > 1) {
      productQt--;
      notifyListeners();
    }
  }

  addProductQuantity() {
    if (productQt < 5) {
      productQt++;
      notifyListeners();
    }
  }
}
