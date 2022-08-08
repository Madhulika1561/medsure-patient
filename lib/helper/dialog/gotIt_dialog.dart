


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';

class GotItDialog extends StatelessWidget{
  const GotItDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: AppColors.lightBackColor.withOpacity(0.8),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(onTap: (){
                  Get.back();
                  },
                  width: Dimension.height102,
                  height: Dimension.height48,
                  btnText: "Got It",
                ),

              ],
            ),
            SizedBox(height: Dimension.height80,),
            Padding(padding: EdgeInsets.only(left: Dimension.height63,right: Dimension.height13,),
              child: Container(
                  width: Dimension.screenWidth,
                  transform: Matrix4.translationValues(0, 5, 0),
                  child: SvgPicture.asset(AppImages.helpImg,fit: BoxFit.fill,)),
            )

          ],
        ),
      ),
    );
  }

}