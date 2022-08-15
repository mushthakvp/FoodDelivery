import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/color/colors.dart';

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

  //snack bar

  var snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      color: scafoldColor,
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
}
