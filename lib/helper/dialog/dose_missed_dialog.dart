


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';


class DoseMissedDialog extends StatelessWidget{
  const DoseMissedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: Dimension.screenWidth*0.52,
            padding: EdgeInsets.symmetric(horizontal: Dimension.width30,vertical: Dimension.height24),
            margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.height24),
                color: AppColors.whiteColor,
                boxShadow:  [
                  BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,5.0),blurRadius: 7.0),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Dimension.height13,),
                Image.asset(AppImages.doseMissedImg,width: 120,height: 120,),
                SizedBox(height: Dimension.height20,),
                SmallText(text: doseMissedText, textColor: AppColors.redBorderColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w500, )

              ],
            ),

          ),
        ),
      ),
    );
  }

}