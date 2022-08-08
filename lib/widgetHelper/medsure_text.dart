

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';

class MedSureText extends StatelessWidget{
  final double textSize;
  final double lintHeight;
   const MedSureText({required this.textSize,required this.lintHeight,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: Dimension.screenWidth,
      height: lintHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Med",style: GoogleFonts.comfortaa(color:AppColors.lightBlackColor,fontSize: textSize,fontStyle: FontStyle.normal,fontWeight: FontWeight.w300,),),
          Text("Sure",style: GoogleFonts.comfortaa(color:AppColors.blackColor,fontSize: textSize,fontStyle: FontStyle.normal,fontWeight: FontWeight.w500,),)

        ],
      ),
    );
  }

}