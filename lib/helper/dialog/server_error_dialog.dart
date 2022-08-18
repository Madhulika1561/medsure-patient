

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ServerErrorDialog extends StatelessWidget{
  final String? errorText;
  final Color?  errorTextColor;
  final String? message;
  final Color?  messageTextColor;

  const ServerErrorDialog({Key? key, this.errorText, this.errorTextColor, this.message, this.messageTextColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: Dimension.screenWidth,
          height: Dimension.screenHeight/3.3,
          padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: 0),
          margin: EdgeInsets.only(left: Dimension.height24,right: Dimension.height24),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Dimension.height24),
              boxShadow: [
                BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,5.0),blurRadius: 7.0),
              ]
          ),
          child: Stack(
             alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  SizedBox(height:Dimension.height54),
                  BigText(text: "Error!", textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
                  SizedBox(height: Dimension.height10,),
                  SmallText(text: errorText.toString(), textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize12, fontWeight: FontWeight.w300,align: TextAlign.center,),

                  SizedBox(height: Dimension.height20,),
                  const Spacer(),
                  AppButton(onTap: (){

                      Get.back();

                  },
                    btnText: "Ok",
                    height: Dimension.height48,
                    width: Dimension.screenWidth*0.42,
                  ),
                  SizedBox(height: Dimension.height10,),
                ],
              ),
              Positioned(
                  top: -35,
                  left: 0,
                  right: 0,
                  child:
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          //borderRadius: BorderRadius.circular(Dimension.height24),
                          boxShadow: [
                            BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,5.0),blurRadius: 7.0),
                          ]
                      ),
                      child: Center(
                        child: Image.asset(AppImages.logoIcon,width: 40,height: 40,),
                      ),
                    ),
                  ) )

            ],
          ),
        ),
      ),
    );
  }

}