

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/auth/forgotPassword/forgotController/forgot_controoler.dart';
import 'package:medsure_patient/auth/forgotPassword/forgot_reset_password_success.dart';
import 'package:medsure_patient/bottom_screen/customBottomTextBar.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ForgotPasswordScreen extends StatelessWidget{
   ForgotPasswordScreen({Key? key}) : super(key: key);

  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.1,
        leading: const CustomBackButton(),
        centerTitle: false,
        title: Padding(
            padding: EdgeInsets.only(left: Dimension.width20,top: Dimension.height10,bottom: 5.0),
            child: SmallText(text: forgotPasswordHeaderText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      bottomNavigationBar: const CustomBottomTextBar(),
      body: Form(
        key: forgotPasswordController.forgotPassGlobalKey,
        child: SizedBox(
          width: Dimension.screenWidth,
          height: Dimension.screenHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: Dimension.width20,right:Dimension.width20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimension.height166,),
                  SmallText(text: enterYourUserNameText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                  SizedBox(height: Dimension.height24,),
                  SmallText(text: userNameText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                  SizedBox(height: Dimension.height08,),
                  SizedBox(
                    height: Dimension.height48,
                    child: TextFormField(
                      style: GoogleFonts.inter(
                        fontSize: Dimension.fontSize16,
                        color: AppColors.lightGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: forgotPasswordController.editUserName,
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      decoration: Common().getInputDecoration(hintText: userHintNameText),
                      validator: (value){
                        return forgotPasswordController.validateForgotPassEmail(value.toString());
                      },

                    ),
                  ),
                  SizedBox(height: Dimension.height32,),
                  buttonWidget()

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buttonWidget()=>AppButton(onTap: (){
    if(forgotPasswordController.forgotPassGlobalKey.currentState!.validate()){
      Get.to(()=>const ForgotResetPassSuccessScreen());
    }

  },
    btnText: sendResetLinkBtnText,
    height: Dimension.height48,
    btnTextColor: AppColors.whiteColor,
  );


}