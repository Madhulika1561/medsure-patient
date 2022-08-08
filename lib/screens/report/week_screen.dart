

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/report/compilance_report.dart';
import 'package:medsure_patient/widget/consumMissedBoxWidegt.dart';
import 'package:medsure_patient/widget/dayBar_widget.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class WeekScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child: SingleChildScrollView(
      padding:  EdgeInsets.only(bottom: Dimension.height50),
      child: Column(
        children: [
         leftRightIconWithDateUI(),
          SizedBox(height: Dimension.height30,),
          const Divider(
            thickness: 1.0,
          ),
          SizedBox(height: Dimension.height08,),
          const ConsumedMissedBoxWidget(),
          SizedBox(height: Dimension.height32,),
          DayBarWidget(
            dateText: '22 Oct',
            consumeMeasureText: '04',
            missedMeasureText: '01',
            consumeFirstFlex: 0,
            consumeSecondFlex: 4,
            missedFirstFlex: 1,
            missedSecondFlex: 3,
            onDateTap: () {
              Get.to(ComplianceReport());
            },
          ),
          DayBarWidget(
            dateText: '23 Oct',
            consumeMeasureText: '04',
            missedMeasureText: '02',
            consumeFirstFlex: 0,
            consumeSecondFlex: 4,
            missedFirstFlex: 2,
            missedSecondFlex: 2,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: '24 Oct',
            consumeMeasureText: '02',
            missedMeasureText: '03',
            consumeFirstFlex: 2,
            consumeSecondFlex: 2,
            missedFirstFlex: 3,
            missedSecondFlex: 1,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: '25 Oct',
            consumeMeasureText: '04',
            missedMeasureText: '0',
            consumeFirstFlex: 0,
            consumeSecondFlex: 4,
            missedFirstFlex: 0,
            missedSecondFlex: 4,
            isMissedZero: true,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: '26 Oct',
            consumeMeasureText: '01',
            missedMeasureText: '03',
            consumeFirstFlex: 3,
            consumeSecondFlex: 1,
            missedFirstFlex: 3,
            missedSecondFlex: 1,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: '27 Oct',
            consumeMeasureText: '0',
            missedMeasureText: '04',
            consumeFirstFlex: 0,
            consumeSecondFlex: 0,
            missedFirstFlex: 4,
            missedSecondFlex: 0,
            isConsumeZero: true,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: '28 Oct',
            consumeMeasureText: '02',
            missedMeasureText: '01',
            consumeFirstFlex: 2,
            consumeSecondFlex: 2,
            missedFirstFlex: 1,
            missedSecondFlex: 3,
            onDateTap: () {

            },
          ),
        ],
      ),
    ));
  }
  Widget leftRightIconWithDateUI()=> Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.blackColor.withOpacity(0.2),size: Dimension.height16,)),
      SmallText(text: reportDateText, textColor: AppColors.lightBlueColor, textSize: Dimension.height16, fontWeight: FontWeight.w700),
      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.blackColor.withOpacity(0.2),size: Dimension.height16,)),

    ],
  );

}