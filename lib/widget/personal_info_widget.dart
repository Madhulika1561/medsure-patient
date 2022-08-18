

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/helper/dialog/delete_dialog.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/accountInfo/editProfile/edit_profile.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/personalInfo_row_text.dart';


class PersonalInfoWidget extends StatelessWidget{
  final String? firstName,lastName,gender,dob,address,city,state,country;
  final int? phoneNumber,postal_code;
   const PersonalInfoWidget( this.firstName,this.lastName,this.gender,this.dob, this.address,
        this.city,  this.state,  this.country,  this.phoneNumber,  this.postal_code, {Key? key}) : super(key: key);

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
      PersonalInfoRowText(firstName: 'First name',lastName: firstName.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Last name',lastName: lastName.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Gender',lastName: gender.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Date of birth',lastName: dob.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Phone number',lastName: phoneNumber.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Address',lastName: address.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'City',lastName: city.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'State',lastName: state.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Postal code',lastName: postal_code.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),
      SizedBox(height: Dimension.height22,),
      PersonalInfoRowText(firstName: 'Country',lastName: country.toString(),textColor: AppColors.lightLBGreyOneColor,textSize: Dimension.fontSize16, fontWeight: FontWeight.w700,fontWeight1: FontWeight.w500),


    ],
  );
  
  Widget deleteEditUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Align(
        alignment: Alignment.center,
          child: InkWell(
            onTap: (){
              Get.to(()=>const EditProfileScreen());
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