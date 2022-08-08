

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/report/month_screen.dart';
import 'package:medsure_patient/screens/report/reportController/report_controller.dart';
import 'package:medsure_patient/screens/report/week_screen.dart';
import 'package:medsure_patient/screens/report/year_screen.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/bouncableWidget.dart';

class ReportScreen extends StatelessWidget{
   ReportScreen({Key? key}) : super(key: key);

   ReportController reportController = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child:  Padding(
          padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54,bottom: Dimension.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: complianceReportText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
              SizedBox(height: Dimension.height30,),
              Row(
                children: [
                  Expanded(child: BounceWidget(text: weekText,textColor: reportController.week.value==true?AppColors.whiteColor:AppColors.blackColor.withOpacity(0.2),
                    color: reportController.week.value==true?AppColors.lightBlueColor:AppColors.lightLBGreyThreeColor,tap: reportController.weekActive,
                    topLeftRadiusSize: Dimension.height50,bottomLeftRadiusSize: Dimension.height50
                    ,)),
                  const SizedBox(width: 2.0,),
                  Expanded(child: BounceWidget(text: monthsText,textColor: reportController.month.value==true?AppColors.whiteColor:AppColors.blackColor.withOpacity(0.2),
                    color: reportController.month.value==true?AppColors.lightBlueColor:AppColors.lightLBGreyThreeColor,tap: reportController.monthsActive,
                    topRightRadiusSize: 0.0,bottomRightRadiusSize: 0.0
                    ,)),
                  const SizedBox(width: 2.0,),
                  Expanded(child: BounceWidget(text: yearText,textColor: reportController.year.value==true?AppColors.whiteColor:AppColors.blackColor.withOpacity(0.2),
                    color: reportController.year.value==true?AppColors.lightBlueColor:AppColors.lightLBGreyThreeColor,tap: reportController.yearActive,
                    topRightRadiusSize: Dimension.height50,bottomRightRadiusSize: Dimension.height50
                    ,)),
                ],
              ),
              SizedBox(height: Dimension.height40,),
              reportController.week.value==true?
              WeekScreen()
              :reportController.month.value==true
              ?const MonthsScreen():const YearScreen()


            ],
          ),
        ),
      ),
    );
  }

}