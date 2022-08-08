
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class DisableFaceTouchIdDialog extends StatelessWidget{
  const DisableFaceTouchIdDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: Dimension.width30,vertical: Dimension.height24),
          margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimension.height24),
            boxShadow:  [BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,5.0),blurRadius: 7.0)],
            color: AppColors.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppImages.errorImg,width: Dimension.height80,height: Dimension.height80,),
              SizedBox(height: Dimension.height20,),
              SmallText(text: disableFaceTouchIdText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w500,align: TextAlign.center,),
              SizedBox(height: Dimension.height10,),
              SmallText(text: doYouWantDisableFaceTouchIdText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500,align: TextAlign.center,),
              SizedBox(height: Dimension.height20,),
              buildButtonUI()

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
          btnText: disableBtnText,
          height: Dimension.height48,
          btnBackgroundColor: AppColors.lightBlueColor,
          btnTextColor: AppColors.whiteColor,),
      )
    ],
  );

}