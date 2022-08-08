

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/call/callController/call_controller.dart';
import 'package:medsure_patient/widgetHelper/app_icons.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class CallScreen extends StatelessWidget{
   //final BuildContext? context;
   CallScreen({Key? key}) : super(key: key);
   CallController controller = Get.put(CallController());

    //modelBottomSheet(co)


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0.0,
        //leading: SizedBox(),
        //leadingWidth: 60.0,
        centerTitle: false,
        title: BigText(text: callText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
      ),
      body: Container(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned( left: 0,right: 0,bottom: 0,
                child: Align(alignment: Alignment.bottomCenter,
            child: Container(
              width: Dimension.screenWidth,
              height: Dimension.screenHeight/2.5,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow:  const [
                    BoxShadow(color: AppColors.shadowColor,offset: Offset(0.0,5.0),blurRadius: 7.0),
                  ],
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimension.height08),topLeft: Radius.circular(Dimension.height08))
              ),
              child: ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>buildShowModelUI()),
            ),

            ))


          ],
        ),
      ),
    );
  }


  Widget buildShowModelUI()=>Container(
    width: Dimension.screenWidth,
    padding: EdgeInsets.only(top:Dimension.height16),

    child: ListTile(
     trailing: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.lightBlackColor,size: Dimension.height16,),
     leading: AppCircleImages(icon: Icons.call, iconColor:AppColors.whiteColor,iconSize: Dimension.height20, size: Dimension.height48,backgroundColor: AppColors.lightBlueColor,shadowColor: AppColors.miniLightBlueColor.withOpacity(0.2),),
     title: BigText(text: pmcText, textColor: AppColors.blackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
     subtitle: Padding(
         padding: EdgeInsets.only(left: 0,right: Dimension.width10,top: Dimension.height08),
         child: SmallText(text: yourPmcText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500)),
     onTap: (){
       controller.openCallDialog();
     },
        ),
  );

}