
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/auth/login/login_screen.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/inter_font_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ForgotResetPassSuccessScreen extends StatelessWidget{
  const ForgotResetPassSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: Container(
        height: Dimension.height32,
        width: Dimension.screenWidth,
        margin:  EdgeInsets.only(left: Dimension.fontSize20, right: Dimension.width20, bottom: Dimension.height20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 100.0,
            child: SvgPicture.asset(AppImages.appLogoIcon),
          ),
        ),
      ),
      body: SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(text: resetPasswordHeaderText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
                SizedBox(height: Dimension.height63,),
                buildImageUI(),
                SizedBox(height: Dimension.height63,),
                buildTextUI(),
                SizedBox(height: Dimension.height40,),
                buttonWidget()


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageUI()=>Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: Dimension.height180,
      height: Dimension.height180,
      child: Center(
        child: Image.asset(AppImages.emailWithBgImg),
      ),
    ),
  );

  Widget buildTextUI()=>Column(
    children: [
      Align(
        alignment: Alignment.center,
          child: SmallText(text: resetPasswordText, textColor: AppColors.restPassTextColor, textSize: Dimension.fontSize18, fontWeight: FontWeight.w500)),
      SizedBox(height: Dimension.height40,),
      Align(
          alignment: Alignment.center,
          child: InterFontText(text: instructionToRestText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400, align: TextAlign.left,)),
      SizedBox(height: Dimension.height20,),
      Align(
          alignment: Alignment.centerLeft,
          child: InterFontText(text: didNotReceiveText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400,align: TextAlign.left)),
    ],
  );

  Widget buttonWidget()=>AppButton(onTap: (){
    Get.to(()=> const LogInScreen());
  },
    btnText: backToLoginBtnText,
    height: Dimension.height48,
    btnTextColor: AppColors.whiteColor,
  );

}

