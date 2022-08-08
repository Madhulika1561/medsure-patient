
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/auth/faceId_setup/success_face_setup.dart';
import 'package:medsure_patient/bottom_screen/customBottomTextBar.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/inter_font_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class FaceIdSetup extends StatelessWidget{
  const FaceIdSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      bottomNavigationBar: const CustomBottomTextBar(),
      body: SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(text: setupFaceIdHeaderText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
                SizedBox(height: Dimension.height75,),
                buildTextUI(),
                SizedBox(height: Dimension.height50,),
                buildImageUI(),
                SizedBox(height: Dimension.height50,),
                Align(
                    alignment: Alignment.center,
                    child: InterFontText(text: pleaseAllowUsText, textColor: AppColors.restPassTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400,align: TextAlign.center)),
                SizedBox(height: Dimension.height40,),
                buttonWidget(),
                SizedBox(height: Dimension.screenHeight/33.76,),
                Align(
                    alignment: Alignment.center,
                    child: SmallText(text: skipText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700,)),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTextUI()=>Column(
    children: [
      Align(
          alignment: Alignment.center,
          child: SmallText(text: doYouWantSetupText, textColor: AppColors.restPassTextColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w500)),
      SizedBox(height: Dimension.height24,),
      Align(
          alignment: Alignment.center,
          child: InterFontText(text: loginQuicklyText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400,align: TextAlign.center)),


    ],
  );
  Widget buildImageUI()=>Align(
    alignment: Alignment.center,
    child: SizedBox(
      width: Dimension.height180,
      height: Dimension.height180,
      child: Center(
        child: Image.asset(AppImages.faceIdImg),
      ),
    ),
  );
  Widget buttonWidget()=>AppButton(onTap: (){
    Get.to(()=> const FaceSetupSuccess());
  },
    btnText: allowText,
    btnTextColor: AppColors.whiteColor,
  );
}