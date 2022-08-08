

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget{
  final String text;
  final Color  textColor;
  final double textSize;
  final FontWeight fontWeight;
  const BigText({Key? key, required this.text, required this.textColor, required this.textSize, required this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      style: GoogleFonts.comfortaa(fontSize: textSize,color: textColor,fontWeight: fontWeight,fontStyle: FontStyle.normal),
    );
  }

}