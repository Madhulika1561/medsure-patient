


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class CallDialog extends StatelessWidget{
  const CallDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: Dimension.screenWidth,
          padding: EdgeInsets.symmetric(horizontal: Dimension.width30,vertical: Dimension.height24),
          margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimension.height24),
              boxShadow:  [
                BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,5.0),blurRadius: 7.0),
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: Dimension.height10,),
              Image.asset(AppImages.callImg,width: 80,height: 80,),
              SizedBox(height: Dimension.height20,),
              SmallText(text: areYouSureCallToText, textColor: AppColors.blackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w500,),
              SizedBox(height: Dimension.height20,),
              buildButtonUI(),
              SizedBox(height: Dimension.height10,),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildButtonUI()=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: Dimension.screenWidth*0.42,
        child: AppButton(onTap: (){
          Get.back();
        },
          btnText: cancelBtnText,
          height: Dimension.height48,
          btnBackgroundColor: AppColors.whiteColor,
          borderColor: AppColors.redBorderColor,
          btnTextColor: AppColors.redBorderColor,),
      ),
      SizedBox(
        width: Dimension.screenWidth*0.42,
        child: AppButton(onTap: (){
          Get.back();
        },
          btnText: callBtnText,
          height: Dimension.height48,
          btnBackgroundColor: AppColors.lightGreenColor,
          btnTextColor: AppColors.whiteColor,),
      )
    ],
  );

}