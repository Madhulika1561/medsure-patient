

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/report/compilance_report.dart';
import 'package:medsure_patient/widget/consumMissedBoxWidegt.dart';
import 'package:medsure_patient/widget/dayBar_widget.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class YearScreen extends StatelessWidget{
  const YearScreen({Key? key}) : super(key: key);

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
            dateText: 'Jan',
            consumeMeasureText: '0',
            missedMeasureText: '0',
            consumeFirstFlex: 5,
            consumeSecondFlex: 1,
            missedFirstFlex: 1,
            missedSecondFlex: 5,
            onDateTap: () {
              Get.to(ComplianceReport());
            },
          ),
          DayBarWidget(
            dateText: 'Feb',
            consumeMeasureText: '75%',
            missedMeasureText: '25%',
            consumeFirstFlex: 0,
            consumeSecondFlex: 4,
            missedFirstFlex: 2,
            missedSecondFlex: 2,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: 'Mar',
            consumeMeasureText: '75%',
            missedMeasureText: '25%',
            consumeFirstFlex: 2,
            consumeSecondFlex: 2,
            missedFirstFlex: 3,
            missedSecondFlex: 1,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: 'Apr',
            consumeMeasureText: '100%',
            missedMeasureText: '0%',
            consumeFirstFlex: 0,
            consumeSecondFlex: 4,
            missedFirstFlex: 0,
            missedSecondFlex: 4,
            isMissedZero: true,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: 'Ṃay',
            consumeMeasureText: '75%',
            missedMeasureText: '25%',
            consumeFirstFlex: 3,
            consumeSecondFlex: 1,
            missedFirstFlex: 3,
            missedSecondFlex: 1,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: 'Jun',
            consumeMeasureText: '0%',
            missedMeasureText: '100%',
            consumeFirstFlex: 0,
            consumeSecondFlex: 0,
            missedFirstFlex: 4,
            missedSecondFlex: 0,
            isConsumeZero: true,
            onDateTap: () {},
          ),
          DayBarWidget(
            dateText: 'Jul',
            consumeMeasureText: '75%',
            missedMeasureText: '25%',
            consumeFirstFlex: 2,
            consumeSecondFlex: 2,
            missedFirstFlex: 1,
            missedSecondFlex: 3,
            onDateTap: () {

            },
          ),
          DayBarWidget(
            dateText: 'Aug',
            consumeMeasureText: '75%',
            missedMeasureText: '25%',
            consumeFirstFlex: 2,
            consumeSecondFlex: 2,
            missedFirstFlex: 1,
            missedSecondFlex: 3,
            onDateTap: () {

            },
          ),
          DayBarWidget(
            dateText: 'Sep',
            consumeMeasureText: '75%',
            missedMeasureText: '25%',
            consumeFirstFlex: 2,
            consumeSecondFlex: 2,
            missedFirstFlex: 1,
            missedSecondFlex: 2,
            onDateTap: () {

            },
          ),
          DayBarWidget(
            dateText: 'Oct',
            consumeMeasureText: '75%',
            missedMeasureText: '25%',
            consumeFirstFlex: 2,
            consumeSecondFlex: 2,
            missedFirstFlex: 1,
            missedSecondFlex: 1,
            onDateTap: () {

            },
          ),
          DayBarWidget(
            dateText: 'Nov',
            consumeMeasureText: '100%',
            missedMeasureText: '20%',
            consumeFirstFlex: 0,
            consumeSecondFlex: 4,
            missedFirstFlex: 1,
            missedSecondFlex: 1,
            onDateTap: () {

            },
          ),
          DayBarWidget(
            dateText: 'Dec',
            consumeMeasureText: '02%',
            missedMeasureText: '01%',
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