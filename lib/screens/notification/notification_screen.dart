

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/model/notificationModel/notification_model.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/notification/notificationController/notification_controller.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class NotificationScreen extends StatelessWidget{
   NotificationScreen({Key? key}) : super(key: key);

   NotificationController notificationController = Get.put(NotificationController());

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
          child: BigText(text: notificationsText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
          itemCount: notificationController.notificationList.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: Dimension.height32),
          itemBuilder: (context,index)=>buildNotificationUI(notificationController.notificationList[index]))
    );
  }
  Widget buildNotificationUI(NotificationModel data)=>Stack(
    children: [
      Container(
        height: Dimension.height89,
        width: Dimension.screenWidth,
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 10.0,
        ),
        decoration: BoxDecoration(
          color: data.bgColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      Container(
        height: Dimension.height89,
        width: Dimension.screenWidth,
        margin: const EdgeInsets.only(
          left: 24.0,
          right: 16.0,
          bottom: 10.0,
        ),
        padding:  EdgeInsets.symmetric(
          horizontal: Dimension.fontSize12,
          vertical: Dimension.fontSize12,
        ),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(4.0),
            bottomRight: Radius.circular(4.0),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightBorderColor,
              blurRadius: 1.0,
              offset: Offset(0.0, 1.0),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(AppImages.mailImg,color: data!=null?data.iconColor:AppColors.lightBlueColor,),
            SizedBox(width: Dimension.width16),
             Padding(
              padding: EdgeInsets.symmetric(vertical: Dimension.fontSize12),
              child:  SizedBox(
                child: VerticalDivider(
                  thickness: 1.2,
                  color: AppColors.blackColor.withOpacity(0.2),
                ),
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: SmallText(text: data.time.toString(), textColor: AppColors.hintTextColor, textSize: Dimension.fontSize12, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4.0,),
                BigText(text: data.title.toString(), textColor: AppColors.blackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                const SizedBox(height: 4.0,),
                SmallText(text: data.subTitle.toString(), textColor: AppColors.hintTextColor, textSize: Dimension.fontSize12, fontWeight: FontWeight.w300)
              ],
            ))
          ],
        ),

      )

    ],

  );

}