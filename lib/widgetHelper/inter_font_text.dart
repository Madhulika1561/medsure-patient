

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterFontText extends StatelessWidget{
  final String text;
  final Color  textColor;
  final double textSize;
  final FontWeight fontWeight;
  final TextAlign align;
  const InterFontText({Key? key, required this.text, required this.textColor, required this.textSize, required this.fontWeight, required this.align}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.inter(fontSize: textSize,color: textColor,fontWeight: fontWeight,fontStyle: FontStyle.normal),
    );
  }
}