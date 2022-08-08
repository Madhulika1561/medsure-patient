

import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/personalInfo_row_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class DeviceInfoScreen extends StatefulWidget{
  const DeviceInfoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_DeviceInfoScreenState();

}
class _DeviceInfoScreenState extends State<DeviceInfoScreen>{
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
            padding: EdgeInsets.only(left: Dimension.width20,top: Dimension.height20,bottom: 5.0),
            child: BigText(text: "Device Information", textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: Dimension.width20,top: Dimension.height50,right: Dimension.width20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(text: "Unit ID: 2356456", textColor: AppColors.blackColor.withOpacity(0.9), textSize: Dimension.fontSize16, fontWeight: FontWeight.w500),
              SizedBox(height: Dimension.height32,),
              SmallText(text: "Unit information", textColor: AppColors.blackColor.withOpacity(0.9), textSize: Dimension.fontSize16, fontWeight: FontWeight.w500),
              SizedBox(height: Dimension.height16,),
              buildUnitInfoUI(),
              SizedBox(height: Dimension.height32,),
              SmallText(text: "Unit agency’s information", textColor: AppColors.blackColor.withOpacity(0.9), textSize: Dimension.fontSize16, fontWeight: FontWeight.w500),
              SizedBox(height: Dimension.height16,),
              buildUnitAgencyInfoUI(),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildUnitInfoUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      PersonalInfoRowText(firstName: 'Unit status',lastName: 'Connected',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'Last IP',lastName: '100:010:022',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'Firmware version',lastName: '3.66 IA',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'Battery status',lastName: '50% remaining',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'Wifi status',lastName: 'Connected',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'Cellular status',lastName: 'Working',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),

    ],
  );
  Widget buildUnitAgencyInfoUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      PersonalInfoRowText(firstName: 'Agency’s contact',lastName: 'harburs@agency.com',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'Address line 1',lastName: '4705 E Southern Ave',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'Address line 2',lastName: 'Phoenix, AK',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),
      SizedBox(height: Dimension.height16,),
      PersonalInfoRowText(firstName: 'My pharmacy',lastName: 'harburs pharmacy',fontWeight: FontWeight.w500,fontWeight1: FontWeight.w700,textSize: Dimension.fontSize14,textColor: AppColors.lightLBGreyOneColor,),


    ],
  );

}