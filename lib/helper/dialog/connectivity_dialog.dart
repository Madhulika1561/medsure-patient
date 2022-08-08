
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ConnectivityDialog extends StatelessWidget{
  const ConnectivityDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
           width: Dimension.screenWidth,
           height: Dimension.height54,
           padding: EdgeInsets.only(left: Dimension.height20,right: Dimension.height20,top: 18,bottom: 18),
           margin: EdgeInsets.only(left: Dimension.height20,right: Dimension.height20,top: 18,bottom: 18),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(Dimension.height24),
             shape: BoxShape.rectangle,
             color: AppColors.lightLBGreyOneColor
           ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.connectivityImg,width: Dimension.height20,height: Dimension.height20,color: AppColors.lightGreyColor,),
                  SizedBox(width: Dimension.width20,),
                  SmallText(text: deviceNotDispensingToText, textColor: AppColors.lightGreyColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400)
                ],
              ),

              InkWell(
                onTap: (){
                  Get.back();
                },
                  child: Icon(Icons.close,color: AppColors.lightGreyColor,size: Dimension.fontSize16,))

            ],
          ),
        ),
      ),
    );
    
  }
  
}