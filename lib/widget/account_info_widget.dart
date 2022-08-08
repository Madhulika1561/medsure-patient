

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/dialog/disable_faceTouchId_dialog.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/screens/accountInfo/changePassword/change_password_screen.dart';
import 'package:medsure_patient/screens/accountInfo/personalInfo/device_info_screen.dart';
import 'package:medsure_patient/screens/accountInfo/personalInfo/personal_Info_screen.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/itemRowWidget.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class AccountInfoWidget extends StatelessWidget{
  const AccountInfoWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildImageUI(),
        SizedBox(height: Dimension.height20,),
        Align(
            alignment: Alignment.topCenter,
            child: SmallText(text: "Moiraine Johnson", textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize18, fontWeight: FontWeight.w400,align: TextAlign.center,)),
        SizedBox(height: Dimension.height16,),
        buildPersonalInfoUI()
      ],
    );
  }
  Widget buildImageUI()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      width: Dimension.height80,
      height: Dimension.height80,
      padding: const EdgeInsets.all(0.0),
      decoration:  BoxDecoration(
          color:AppColors.miniLightBlueColor,
          borderRadius: BorderRadius.circular(Dimension.height40),
          boxShadow: const [BoxShadow(color: AppColors.lightBlueColor,offset: Offset(0.0,1.0),blurRadius: 1.0)]
      ),
      child: Center(
        child: BigText(text: "MJ", textColor: AppColors.whiteColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w700),
      ),
    ),
  );

  Widget buildPersonalInfoUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: (){
          Get.to(()=>const PersonalInfoScreen());
        },
        child: Container(
          width: Dimension.screenWidth,
          height: Dimension.height54,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(Dimension.height08),
            boxShadow:  [BoxShadow(color: const Color(0xFFd08a3f).withOpacity(0.2),offset: const Offset(0.0,2.0),blurRadius: 1.0)]
          ),
          child: Center(
              child: ItemRowWidget(itemName: "Personal Information",
                icon: Icons.arrow_forward_ios_outlined,iconSize: Dimension.height14,
                leftPadding: Dimension.fontSize12,rightPadding: Dimension.fontSize12,
                topPadding: Dimension.fontSize12,bottomPadding: Dimension.fontSize12,textSize: Dimension.fontSize16,fontWeight: FontWeight.w500,)),
        ),
      ),
      SizedBox(height: Dimension.height16,),
      GestureDetector(
        onTap: (){
          Get.dialog(const DisableFaceTouchIdDialog());
        },
        child: Container(
          width: Dimension.screenWidth,
          height: Dimension.height54,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimension.height08),
              boxShadow:  [BoxShadow(color: const Color(0xFFd08a3f).withOpacity(0.2),offset: const Offset(0.0,2.0),blurRadius: 1.0)]
          ),
          child: Center(
              child: ItemRowWidget(itemName: "Enable/Disable Face ID",
                icon: Icons.arrow_forward_ios_outlined,iconSize: Dimension.height14,
                leftPadding: Dimension.fontSize12,rightPadding: Dimension.fontSize12,
                topPadding: Dimension.fontSize12,bottomPadding: Dimension.fontSize12,textSize: Dimension.fontSize16,fontWeight: FontWeight.w500,)),
        ),
      ),
      SizedBox(height: Dimension.height16,),
      GestureDetector(
        onTap: (){
          Get.to(()=>const ChangePasswordScreen());
        },
        child: Container(
          width: Dimension.screenWidth,
          height: Dimension.height54,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimension.height08),
              boxShadow:  [BoxShadow(color: const Color(0xFFd08a3f).withOpacity(0.2),offset: const Offset(0.0,2.0),blurRadius: 1.0)]
          ),
          child: Center(
              child: ItemRowWidget(itemName: "Change Password",
                icon: Icons.arrow_forward_ios_outlined,iconSize: Dimension.height14,
                leftPadding: Dimension.fontSize12,rightPadding: Dimension.fontSize12,
                topPadding: Dimension.fontSize12,bottomPadding: Dimension.fontSize12,textSize: Dimension.fontSize16,fontWeight: FontWeight.w500,)),
        ),
      ),
      SizedBox(height: Dimension.height16,),
      GestureDetector(
        onTap: (){
          Get.to(()=>const DeviceInfoScreen());
        },
        child: Container(
          width: Dimension.screenWidth,
          height: Dimension.height54,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(Dimension.height08),
              boxShadow:  [BoxShadow(color: const Color(0xFFd08a3f).withOpacity(0.2),offset: const Offset(0.0,2.0),blurRadius: 1.0)]
          ),
          child: Center(
              child: ItemRowWidget(itemName: "Device Information",
                icon: Icons.arrow_forward_ios_outlined,iconSize: Dimension.height14,
                leftPadding: Dimension.fontSize12,rightPadding: Dimension.fontSize12,
                topPadding: Dimension.fontSize12,bottomPadding: Dimension.fontSize12,textSize: Dimension.fontSize16,fontWeight: FontWeight.w500,)),
        ),
      ),

    ],
  );
}