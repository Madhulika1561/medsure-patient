

import 'package:flutter/material.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/medsure_text.dart';
import 'package:medsure_patient/widgetHelper/underline_text.dart';


class ChoicesScreen extends StatelessWidget{
  const ChoicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:
      SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: Dimension.width33,right: Dimension.width33),
            child: Column(
              children: [
                SizedBox(height: Dimension.height65,),
                MedSureText(textSize: Dimension.height40, lintHeight: Dimension.height40),
                SizedBox(height: Dimension.height89,),
                imageUI(),
                SizedBox(height: Dimension.height20,),
                BigText(text: unlockTouchFaceText, textColor: AppColors.blackColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w500),
                SizedBox(height: Dimension.height30,),
                BigText(text: orText, textColor: AppColors.blackColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w500),
                SizedBox(height: Dimension.height50,),
                Container(
                  width: Dimension.screenWidth,
                  height: 43,
                  decoration: Common().getBoxDecoration(color: AppColors.lightBackgroundColor),
                  child: Center(
                    child: UnderLineText(text: loginWithUserName, textColor: AppColors.blackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: Dimension.height08,),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                    child: UnderLineText(text: doNotHaveAccount, textColor: AppColors.blackMiniColor, textSize: Dimension.fontSize12, fontWeight: FontWeight.w500))

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: Dimension.height40,right: Dimension.width33),
        child: Row(
         // crossAxisAlignment:CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: Dimension.height20,
              height: Dimension.height20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.blackColor,width: 1),
              ),
              child: Center(child: Icon(Icons.question_mark,color: AppColors.blackColor,size: Dimension.iconSize12,)),
            ),
            SizedBox(width: Dimension.fontSize12,),
            UnderLineText(text: needHelp, textColor: AppColors.blackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500)
          ],
        ),
      ),

    );
  }

  Widget imageUI()=>Image.asset(AppImages.faceTouchIcon,width: 150,height: 150);

}