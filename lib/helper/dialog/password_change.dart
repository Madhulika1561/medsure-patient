

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/inter_font_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ChangePasswordSuccessDialog extends StatelessWidget{
  const ChangePasswordSuccessDialog({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(horizontal: Dimension.width30,vertical: Dimension.height24),
            margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow:   [BoxShadow(color:AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,5.0),blurRadius: 7.0)],
              borderRadius: BorderRadius.circular(Dimension.height24)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.passwordSuccessImg,width: Dimension.height80,height: Dimension.height80,),
                SizedBox(height: Dimension.height20,),
                SmallText(text: passwordChangeText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w700,align: TextAlign.center,),
                SizedBox(height: Dimension.height08,),
                InterFontText(text: changePasswordSuccessText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w400,align: TextAlign.center,),

              ],
            ),
          ),
        ),
      ),
    );
  }

}