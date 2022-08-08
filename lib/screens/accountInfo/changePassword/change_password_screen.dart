

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/auth/forgotPassword/forgot_password_screen.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/screens/accountInfo/changePassword/changePasswordController/change_pass_cotr.dart';
import 'package:medsure_patient/screens/accountInfo/changePassword/reset_password_screen.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/inter_font_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ChangePasswordScreen extends StatefulWidget{
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_ChangePasswordScreenState();

}
class _ChangePasswordScreenState extends State<ChangePasswordScreen>{

  ChangePassController changePassController = Get.put(ChangePassController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.1,
        centerTitle: false,
        leading: const CustomBackButton(iconColor: AppColors.blackColor,),
        title: Padding(
            padding: EdgeInsets.only(left: Dimension.width20,top: Dimension.height16,bottom: 5.0),
            child: BigText(text: "Change Password", textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      body: Form(
        key: changePassController.changeGlobalKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 171,),
                SmallText(text: "Old password", textColor: AppColors.hintTextColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
                SizedBox(height: Dimension.height08,),
                TextFormField(
                  style: GoogleFonts.inter(
                    fontSize: Dimension.fontSize16,
                    color: AppColors.lightGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: changePassController.editOldPassword,
                  obscuringCharacter: "*",
                  obscureText: changePassController.isHidePass.value,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16)
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
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
                      hintText: "Old password",
                      hintStyle: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            changePassController.isHidePass.value = !changePassController.isHidePass.value;
                          });


                        },
                        icon: Image.asset(changePassController.isHidePass.value ? AppImages.eyeCloseIcon:AppImages.eyeOpenIcon,width: Dimension.height20,height: Dimension.height20,color: AppColors.lightGreyColor,),
                      )
                  ),
                  validator: (value){
                    return changePassController.validateChangeOldPass(value.toString());
                  },


                ),
                SizedBox(height: Dimension.height10,),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>ForgotPasswordScreen());
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SmallText(text: "Forgot password?", textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: Dimension.height32,),

                ///new password
                SmallText(text: "New password", textColor: AppColors.hintTextColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
                SizedBox(height: Dimension.height08,),
                TextFormField(
                  style: GoogleFonts.inter(
                    fontSize: Dimension.fontSize16,
                    color: AppColors.lightGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: changePassController.editNewPassword,
                  obscuringCharacter: "*",
                  obscureText: changePassController.isHideNewPass.value,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16)
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding:  EdgeInsets.only(left: Dimension.width20,top: Dimension.height10),
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
                      hintText: "New password",
                      hintStyle: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            changePassController.isHideNewPass.value = !changePassController.isHideNewPass.value;
                          });


                        },
                        icon: Image.asset(changePassController.isHideNewPass.value ? AppImages.eyeCloseIcon:AppImages.eyeOpenIcon,width: Dimension.height20,height: Dimension.height20,color: AppColors.lightGreyColor,),
                      )
                  ),
                  validator: (value){
                    return changePassController.validateChangePassPassword(value.toString());
                  },


                ),
                SizedBox(height: Dimension.height10,),
                InterFontText(text: "Password must include a minimum of 6 characters.", textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400,align: TextAlign.start,),

                ///confirm password
                SizedBox(height: Dimension.height32,),
                SmallText(text: "Re-enter new password", textColor: AppColors.hintTextColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
                SizedBox(height: Dimension.height08,),
                TextFormField(
                  style: GoogleFonts.inter(
                    fontSize: Dimension.fontSize16,
                    color: AppColors.lightGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: changePassController.editConfirmPassword,
                  obscuringCharacter: "*",
                  obscureText: changePassController.isHideRePass.value,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16)
                  ],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      contentPadding:  EdgeInsets.only(left: Dimension.width20,top: Dimension.height10),
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
                      hintText: "Re-enter new password",
                      hintStyle: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            changePassController.isHideRePass.value = !changePassController.isHideRePass.value;
                          });


                        },
                        icon: Image.asset(changePassController.isHideRePass.value ? AppImages.eyeCloseIcon:AppImages.eyeOpenIcon,width: Dimension.height20,height: Dimension.height20,color: AppColors.lightGreyColor,),
                      )
                  ),
                  validator: (value){
                    return changePassController.validateChangeRePassPassword(value.toString());
                  },


                ),

                ///button
                SizedBox(height: Dimension.height32,),
                AppButton(onTap: (){
                  /*if(changePassController.editNewPassword.text.toString().trim()!=changePassController.editConfirmPassword.text.toString().trim()){

                  }*/
                  if(changePassController.changeGlobalKey.currentState!.validate()){
                    Get.to(()=>ResetPasswordScreen());
                  }
                },
                  btnText: "Reset password",
                  height: Dimension.height48,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}