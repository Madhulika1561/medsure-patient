
import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';

class RichTextWidget extends StatelessWidget {
  final String? firstText;
  final String? secondText;

   const RichTextWidget({Key? key, this.firstText, this.secondText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText!,
        style: TextStyle(fontSize:Dimension.fontSize14,color:AppColors.lightBlackColor,fontWeight: FontWeight.w400),
        children: <TextSpan>[
          TextSpan(
              text: secondText!,
              style: TextStyle(fontSize:Dimension.fontSize14,color:AppColors.lightBlueColor,fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}