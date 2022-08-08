

import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class MedicineItemDetailsWidget extends StatelessWidget{
  final String itemName;
  final String subItemName;
  final String weight;
  final String firstTime;
  final String? secondTime;
  final String? thirdTime;

  const MedicineItemDetailsWidget({Key? key, required this.itemName, required this.subItemName, required this.weight, required this.firstTime,  this.secondTime="1:00 PM",  this.thirdTime="8:00 PM"}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: Dimension.screenWidth,
      padding: EdgeInsets.all(Dimension.height16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow:  [BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,4.0),blurRadius: 5.0)]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: itemName, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
                  SizedBox(height: Dimension.height08,),
                  SmallText(text: subItemName, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500)
                ],
              )),
              BigText(text: weight, textColor: AppColors.blackColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)

            ],
          ),
          SizedBox(height: Dimension.height10,),
          const Divider(thickness: 0.9,),
          Row(
            children: [
              SmallText(text: firstTime, textColor: AppColors.blackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700),
              SizedBox(width: Dimension.width16,),
              Image.asset(AppImages.rectangleImg),
              SizedBox(width: Dimension.width16,),
              SmallText(text: secondTime!, textColor: AppColors.blackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700),
              SizedBox(width: Dimension.width16,),
              Image.asset(AppImages.rectangleImg),
              SizedBox(width: Dimension.width16,),
              SmallText(text: thirdTime!, textColor: AppColors.blackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700)
            ],
          )
        ],
      ),
    );
  }

}