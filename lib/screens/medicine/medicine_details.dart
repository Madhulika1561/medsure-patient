

import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/medicine/medicineController/medicine_controller.dart';
import 'package:medsure_patient/screens/report/component/graphData.dart';
import 'package:medsure_patient/widget/medicine_item_details_widget.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/inter_font_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';
import 'package:pie_chart/pie_chart.dart';

class MedicineDetailsScreen extends StatelessWidget{
   MedicineDetailsScreen({Key? key}) : super(key: key);

  MedicineController medicineController = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        leading: const CustomBackButton(),
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(top: Dimension.height10),
            child: BigText(text: medicineDetailsText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const MedicineItemDetailsWidget(itemName: rosuvastatineText, subItemName: takenBeforeFoodText, weight: gram20Text, firstTime: timeText,secondTime: "1:00 PM",),
              SizedBox(height: Dimension.height32,),
              SmallText(text: statisticsText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700),
              SizedBox(height: Dimension.height30,),
              pieChartUI(),
              SizedBox(height: Dimension.height63,),
              SmallText(text: remarksText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700),
              SizedBox(height: Dimension.height14,),
              InterFontText(text: educationalContentText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400, align: TextAlign.start,),

            ],
          ),
        ),
      ),
    );
  }
  Widget pieChartUI()=>Row(
    //crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 128,
        height: 128,
        margin: EdgeInsets.symmetric(horizontal: Dimension.fontSize20),
        child: PieChart(
          dataMap: medicineController.dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: Dimension.width33,
          chartRadius: Dimension.screenWidth,
          colorList:  [
            AppColors.lightBlueColor,
            AppColors.redBorderColor,
            AppColors.lightActiveFieldBorderColor.withOpacity(0.5)
          ],
          initialAngleInDegree: 270,
          ringStrokeWidth: Dimension.height16,
          totalValue: 100,
          chartType: ChartType.ring,
          legendOptions: LegendOptions(
            showLegends: false,
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            legendShape: BoxShape.rectangle,
            legendTextStyle: GoogleFonts.inter().copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.hintTextColor,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 1
          ),



        ),
      ),
      SizedBox(width: Dimension.height10,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: SmallText(text: "Total regimens", textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400)),
                SmallText(text: "100", textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700)
              ],
            ),
            SizedBox(height: Dimension.height14,),
            const GraphData(text: "Consumed",boxColor: AppColors.lightBlueColor,value: "50",),
            SizedBox(height: Dimension.height14,),
            const GraphData(text: "Missed",boxColor: AppColors.redBorderColor,value: "25",),
            SizedBox(height: Dimension.height14,),
            GraphData(text: "Remaining",boxColor: AppColors.lightActiveFieldBorderColor.withOpacity(0.5),value: "25",)

          ],
        ),
      )
    ],
  );
}