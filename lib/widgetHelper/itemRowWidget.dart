import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/inter_font_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ItemRowWidget extends StatelessWidget {
  final String? itemName;
  final String? itemWeight;
  final IconData? icon;
  final Color? textColor;
  final FontWeight? fontWeight;
  final FontWeight? fontWeight1;
  final double? iconSize,textSize;
  final double? leftPadding,rightPadding,topPadding,bottomPadding;

  const ItemRowWidget({Key? key,
    required this.itemName,
    this.itemWeight="", this.icon, this.textColor, this.iconSize=14.0, this.leftPadding=0.0, this.rightPadding=0.0,
    this.topPadding=12.0, this.bottomPadding=0.0, this.textSize=14.0, this.fontWeight=FontWeight.w700, this.fontWeight1=FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: topPadding!,left: leftPadding!,right: rightPadding!,bottom: bottomPadding!),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(text: itemName!, textColor: AppColors.lightBlackColor, textSize: textSize!, fontWeight: fontWeight!),
         Row(
           children: [
             InterFontText(text: itemWeight.toString(), textColor: AppColors.hintTextColor, textSize: textSize!, fontWeight: fontWeight1!,align: TextAlign.start,),
             SizedBox(width: Dimension.width16,),
             Icon(icon,size: iconSize!,color:AppColors.blackColor,)
           ],
         )

        ],
      ),
    );
  }
}
