
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/auth/login/login_screen.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class FaceSetupSuccess extends StatelessWidget{
  const FaceSetupSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
        child: Stack(
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               buildImageUI(),
               SizedBox(height: Dimension.height40,),
               Align(
                   alignment: Alignment.center,
                   child: SmallText(text: yourAuthenticationText, textColor: AppColors.restPassTextColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w500)),
               SizedBox(height: Dimension.height32,),
               buttonWidget()

             ],
           ),
           Positioned(
             top: Dimension.height20,
               left: Dimension.width16,
               right: Dimension.width16,
               child: SmallText(text: setupFaceIdHeaderText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700))
         ],
        ),
      ),
    );
  }
  Widget buildImageUI()=>SizedBox(
    width: Dimension.height180,
    height: Dimension.height180,
    child: Center(
      child: Image.asset(AppImages.successImg),
    ),
  );
  Widget buttonWidget()=>AppButton(onTap: (){
    Get.to(()=>  const LogInScreen());
  },
    btnText: continueBtnText,
    height: Dimension.height48,
    btnTextColor: AppColors.whiteColor,
  );
}