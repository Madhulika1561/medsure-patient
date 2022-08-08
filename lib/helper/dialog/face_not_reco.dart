

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class FaceNotRecoDialog extends StatelessWidget{
  const FaceNotRecoDialog({Key? key}) : super(key: key);


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
              SizedBox(height: Dimension.height20,),
              Image.asset(AppImages.errorImg,width: 80,height: 80,),
              SizedBox(height: Dimension.height20,),
              SmallText(text: faceNotRecoText, textColor: AppColors.blackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w500,),
              SizedBox(height: Dimension.height20,),
              buildButtonUI(),
              SizedBox(height: Dimension.height20,),

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
          btnTextColor: AppColors.lightBlueColor,),
      ),
      SizedBox(
        width: Dimension.screenWidth*0.42,
        child: AppButton(onTap: (){
          Get.back();
        },
          btnText: retryBtnText,
          height: Dimension.height48,
          btnTextColor: AppColors.whiteColor,),
      )
    ],
  );

}