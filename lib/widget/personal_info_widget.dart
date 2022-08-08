

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/helper/dialog/delete_dialog.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/accountInfo/editProfile/edit_profile.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/itemRowWidget.dart';
import 'package:medsure_patient/widgetHelper/personalInfo_row_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class PersonalInfoWidget extends StatelessWidget{
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildImageUI(),
        SizedBox(height: Dimension.height40,),
        informationUI(),
        SizedBox(height: Dimension.height54,),
        deleteEditUI()
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
  Widget informationUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      PersonalInfoRowText(firstName: 'First name',lastName: 'Moiraine',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Last name',lastName: 'Johnson',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Gender',lastName: 'Male',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Date of birth',lastName: 'October 28, 1957',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Phone number',lastName: '+1 345-678-9098',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Address',lastName: 'Mongolia Ave,300N',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'City',lastName: 'Pittsburgh',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'State',lastName: 'Pennsylvania',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Postal code',lastName: '15106',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Country',lastName: 'United States',textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),


    ],
  );
  
  Widget deleteEditUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.center,
          child: InkWell(
            onTap: (){
              Get.to(()=>EditProfileScreen());
            },
              child: Text(editProfileText,style: GoogleFonts.openSans(color: AppColors.lightBlueColor,fontSize: Dimension.fontSize16,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,),))),
      SizedBox(height: Dimension.height16,),
      GestureDetector(
        onTap: (){
          Get.dialog(const DeleteDialog());
        },
        child: Align(
            alignment: Alignment.center,
            child: Text(deleteAccountText,style: GoogleFonts.openSans(color: AppColors.lightBlueColor,fontSize: Dimension.fontSize16,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,),)),
      )
    ],
  );

}