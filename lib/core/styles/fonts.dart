import 'package:flutter/cupertino.dart';
import 'package:food_delivery/core/color/colors.dart';
import 'package:google_fonts/google_fonts.dart';

gFontsOleo({double sz = 16, double ls = 0, FontWeight fw = FontWeight.normal, Color cl = blackColor}) {
  return GoogleFonts.mukta(
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}

gFontsSans({double sz = 16, double ls = 0, FontWeight fw = FontWeight.normal, Color cl = blackColor}) {
  return GoogleFonts.firaSansCondensed(
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}
