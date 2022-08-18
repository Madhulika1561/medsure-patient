



import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/help/component/video_pageBody.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class HelpScreen extends StatefulWidget{
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.1,
        centerTitle: false,
        title: BigText(text: help, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SizedBox(height: Dimension.height13),
            buildTextUI(),
            SizedBox(height: Dimension.height10),
            const HelpVideoPageBody(),
            SizedBox(height: Dimension.height20),
            buildEducationalTextUI(),
            SizedBox(height: Dimension.height20),
            buildGuideTextUI(),
          ],
        ),
      ),
    );
  }

  Widget buildTextUI()=>Padding(
    padding:  EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(
            child: SmallText(text: webViewText, textColor: Colors.black, textSize: Dimension.fontSize14, fontWeight: FontWeight.w300)
        ),

        /// help text
        const SizedBox(height: 4.0),
        SmallText(text: help, textColor: Colors.black, textSize: Dimension.fontSize18, fontWeight: FontWeight.w500),

        /// more info video texts
        SizedBox(height: Dimension.screenHeight * 0.024),
        SmallText(text: moreInfoVideoText, textColor: Colors.black, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500),
      ],
    ),
  );
  Widget buildEducationalTextUI()=>Padding(
    padding:  EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallText(text: educationalMaterialText, textColor: Colors.black, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500),
        SizedBox(height: Dimension.screenHeight * 0.024),
        Container(
            width: Dimension.screenWidth,
            height: Dimension.screenHeight/8.76,
            decoration: const BoxDecoration(
                color: AppColors.videoBackColor,
                shape: BoxShape.rectangle
            ),
            child: Center(
              child: Container(
                width: Dimension.screenHeight/17.16,
                height: Dimension.screenHeight/17.16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.whiteColor,width: 1),
                ),
                child: Center(
                  child: Icon(Icons.play_arrow,size: Dimension.height24,color: AppColors.whiteColor,),
                ),
              ),
            )
        ),
        SizedBox(height: Dimension.height20,),
        SmallText(text: educationalContentText, textColor: AppColors.blackMiniColor, textSize: Dimension.fontSize12, fontWeight: FontWeight.w300)

      ],
    ),
  );
  Widget buildGuideTextUI()=>Padding(
    padding:  EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallText(text: guidesText, textColor: Colors.black, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500),
        SizedBox(height: Dimension.height10,),
        SmallText(text: educationalContentText, textColor: AppColors.blackMiniColor, textSize: Dimension.fontSize12, fontWeight: FontWeight.w300)

      ],
    ),
  );
}