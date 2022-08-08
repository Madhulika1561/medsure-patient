

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ShowProgressDialog extends StatelessWidget{
  final String loadingText;
  final bool? isLoading;
    ShowProgressDialog({Key? key, required this.loadingText, this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Center(
        child: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: Dimension.height177,
            padding: EdgeInsets.symmetric(horizontal: Dimension.width30,vertical: Dimension.height24),
            margin: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(Dimension.height24),
                boxShadow:  [
                  BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,5.0),blurRadius: 7.0),
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(color: AppColors.lightBlueColor,strokeWidth: 3.0,),
                SizedBox(width: Dimension.height16,),
                SmallText(text: loadingText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.normal)
              ],
            ),
          ),
        ),
      )
    );
  }

}