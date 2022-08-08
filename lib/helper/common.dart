

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/helper/dialog/show_progress_dialog.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/screens/call/call_screen.dart';
import 'package:medsure_patient/screens/help/help_sceen.dart';
import 'package:medsure_patient/screens/home/home_screen.dart';
import 'package:medsure_patient/screens/medicine/medicine_screen.dart';
import 'package:medsure_patient/screens/report/report_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class Common{


 bool emailValidation(String email){
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  bool passwordValidation(String password){
   String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
   RegExp regExp = RegExp(pattern);
   return regExp.hasMatch(password);
  }

  BoxDecoration getBoxDecoration({required Color color}){
    return BoxDecoration(
      color: color,
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(color: Colors.grey.shade50,offset: const Offset(1,2),blurRadius: 2)
      ]
    );
  }

  InputDecoration getInputDecoration({required String hintText}){
    return InputDecoration(
      contentPadding:  EdgeInsets.only(left: Dimension.width20),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimension.height10),
        borderSide: const BorderSide(
          color: AppColors.lightFieldBorderColor,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimension.height10),
        borderSide: const BorderSide(
          color: AppColors.lightActiveFieldBorderColor,
          width: 1.0,
        ),
      ),
      fillColor: AppColors.lightOrangeBackColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimension.height10),
        borderSide: const BorderSide(
          color: AppColors.lightActiveFieldBorderColor,
          width: 1.0,
        ),
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.inter(
        fontSize: Dimension.fontSize16,
        color: AppColors.lightGreyColor,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal
      ),
    );
  }

  //bottom screen page list

  final screens = [MedicineScreen(), ReportScreen(),HomeScreen(), CallScreen(),const HelpScreen()];
  static List<PersistentBottomNavBarItem> navBarItem(){
   
   return [
     //medicine
     PersistentBottomNavBarItem(
         icon: SvgPicture.asset(AppImages.medicineActiveIcon),
         title: "Medicine",
         textStyle: GoogleFonts.comfortaa(color: AppColors.hintTextColor,fontSize: Dimension.fontSize12,fontWeight: FontWeight.w700),
         inactiveIcon: SvgPicture.asset(AppImages.medicineInActiveIcon),
         activeColorSecondary: AppColors.lightBlueColor ,
         activeColorPrimary: AppColors.shadowColor


     ),
     //report
     PersistentBottomNavBarItem(
         icon: SvgPicture.asset(AppImages.reportActiveIcon),
         title: "Report",
         textStyle: GoogleFonts.comfortaa(color: AppColors.hintTextColor,fontSize: Dimension.fontSize12,fontWeight: FontWeight.w700),
         inactiveIcon: SvgPicture.asset(AppImages.reportInActiveIcon),
         activeColorSecondary: AppColors.lightBlueColor,
         activeColorPrimary: AppColors.shadowColor


     ),
     //home
     PersistentBottomNavBarItem(
         icon: SvgPicture.asset(AppImages.homeActiveIcon),
         title: "Home",
         textStyle: GoogleFonts.comfortaa(color: AppColors.hintTextColor,fontSize: Dimension.fontSize12,fontWeight: FontWeight.w700),
         inactiveIcon: SvgPicture.asset(AppImages.homeInActiveIcon),
         activeColorSecondary: AppColors.lightBlueColor,
         activeColorPrimary: AppColors.shadowColor


     ),
     //call
     PersistentBottomNavBarItem(
         icon: SvgPicture.asset(AppImages.callActiveIcon),
         title: "Call",
         textStyle: GoogleFonts.comfortaa(color: AppColors.hintTextColor,fontSize: Dimension.fontSize12,fontWeight: FontWeight.w700),
         inactiveIcon: SvgPicture.asset(AppImages.callInActiveIcon),
         activeColorSecondary: AppColors.lightBlueColor,
         activeColorPrimary: AppColors.shadowColor


     ),
     PersistentBottomNavBarItem(
         icon: SvgPicture.asset(AppImages.helpActiveIcon),
         title: "Help",
         textStyle: GoogleFonts.comfortaa(color: AppColors.hintTextColor,fontSize: Dimension.fontSize12,fontWeight: FontWeight.w700),
         inactiveIcon: SvgPicture.asset(AppImages.helpInActiveIcon),
         activeColorSecondary: AppColors.lightBlueColor,
         activeColorPrimary: AppColors.shadowColor


     )
   ];
   
  }

  static void showLoading({required String message,bool isLoading = false}) async{
    isLoading = true;
    Get.dialog(ShowProgressDialog(loadingText: message,),barrierDismissible: true);
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
  }
  static void hideLoading(){
    if(Get.isDialogOpen!) {
      Get.back();
    }
  }




}