

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widget/personal_info_widget.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';

class PersonalInfoScreen extends StatefulWidget{
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_PersonalInfoScreenState();

}
class _PersonalInfoScreenState extends State<PersonalInfoScreen>{
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
            padding: EdgeInsets.only(left: Dimension.width20,top: Dimension.height16,bottom: 5.0),
            child: BigText(text: personalInfoText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimension.height40,),
            Padding(
                padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
                child: const PersonalInfoWidget()),

          ],
        ),
      ),
    );
  }

}