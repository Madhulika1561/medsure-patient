

import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';


class PrivacyPolicyScreen extends StatelessWidget{
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

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
            child: BigText(text: privacyPolicyText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Dimension.screenWidth,
          height: Dimension.screenHeight,
          padding: EdgeInsets.only(left: Dimension.width24, right: Dimension.width24,top: Dimension.height54),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SmallText(text: webViewText, textColor: AppColors.blackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: Dimension.height14,),
              SmallText(text: privacyPolicyContentText, textColor: AppColors.greyLightColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
            ],
          ),

        ),
      ),
    );
  }


}