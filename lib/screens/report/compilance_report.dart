

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/model/reportModel/compliance_report_model.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/report/component/graphData.dart';
import 'package:medsure_patient/screens/report/reportController/report_controller.dart';
import 'package:medsure_patient/widgetHelper/app_icons.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/itemRowWidget.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';
import 'package:pie_chart/pie_chart.dart';

class ComplianceReport extends StatelessWidget{
   ComplianceReport({Key? key}) : super(key: key);
  final ReportController reportController = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: const CustomBackButton(),
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(top: Dimension.height10),
            child: BigText(text: complianceReportText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      body: SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child: ListView(
          children: [
             Padding(
              padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54,bottom: Dimension.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLeftRightButtonWithDate(),
                  SizedBox(height: Dimension.height32,),
                  SmallText(text: statisticsText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700),
                  SizedBox(height: Dimension.height30,),
                  pieChartUI(),
                  SizedBox(height: Dimension.height48,),
                  SizedBox(
                    width: Dimension.screenWidth,
                    height: Dimension.screenHeight,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: reportController.complianceList.length,
                        itemBuilder: (context,index)=>complianceListViewUI(reportController.complianceList[index])),
                  )
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
  Widget buildLeftRightButtonWithDate()=>Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
          onTap: (){
            reportController.isPrevFun();
          },
          child: AppCircleImages( icon: Icons.arrow_back_ios_new, size: Dimension.height40, iconSize: Dimension.fontSize18,backgroundColor: AppColors.lightActiveFieldBorderColor,iconColor: AppColors.whiteColor,)),
          SmallText(text: reportController.isNext.value==false?"05-27-2022" : "05-28-2022", textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w700),
      InkWell(
          onTap: (){
            reportController.isNextFun();

          },
          child: AppCircleImages( icon: Icons.arrow_forward_ios_outlined, size: Dimension.height40, iconSize: Dimension.fontSize18,backgroundColor: AppColors.lightActiveFieldBorderColor,iconColor: AppColors.whiteColor,))

    ],
  );

  Widget pieChartUI()=>Row(
    //crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: Dimension.height130,
        height: Dimension.height130,
        margin: EdgeInsets.symmetric(horizontal: Dimension.fontSize20),
        child: PieChart(
          dataMap: reportController.dataMap,
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: Dimension.width33,
          chartRadius: Dimension.screenWidth,
          colorList: const [
            AppColors.lightBlueColor,
            AppColors.redBorderColor
          ],
          initialAngleInDegree: 0,
          ringStrokeWidth: Dimension.height16,
          totalValue: 3,
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
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: SmallText(text: totalRegimensText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400)),
                SmallText(text: "03", textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700)
              ],
            ),
            SizedBox(height: Dimension.height14,),
            const GraphData(text: consumedText,boxColor: AppColors.lightBlueColor,value: "03",),
            SizedBox(height: Dimension.height14,),
            const GraphData(text: missedText,boxColor: AppColors.redBorderColor,value: "01",)

          ],
        ),
      )
    ],
  );


  Widget complianceListViewUI(ComplianceReportModel data)=>Container(
    padding: EdgeInsets.all(Dimension.height16),
    margin: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height08,bottom: Dimension.height08),
    decoration: BoxDecoration(
      color: data.bgColor,
      borderRadius: BorderRadius.circular(4.0),
      boxShadow:  [BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,4.0),blurRadius: 5.0,),]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: data.title.toString(), textColor: data.title.toString()=="Consumed"?AppColors.lightBlueColor:AppColors.lightLBRedColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w500),
        SizedBox(height: Dimension.height10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmallText(text: data.time.toString(), textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
            SmallText(text: data.subTitle.toString(), textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500)
          ],
        ),
        SizedBox(height: Dimension.height10,),
        const Divider(thickness: 1.0,),
        SizedBox(height: Dimension.height14,),
         ItemRowWidget(itemName: rosuvastatineText, itemWeight: gram20Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14,),
        SizedBox(height: Dimension.height24,),
         ItemRowWidget(itemName: farxigaText, itemWeight: gram10Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14),
        SizedBox(height: Dimension.height24,),
         ItemRowWidget(itemName: brilintaText, itemWeight: gram40Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14),
        SizedBox(height: Dimension.height24,),
         ItemRowWidget(itemName: aspirinText, itemWeight: gram80Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14),


      ],
    ),
  );
  
}