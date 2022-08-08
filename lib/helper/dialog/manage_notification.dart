

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:medsure_patient/helper/dialog/manage_profile_dialog.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class ManageNotification extends StatelessWidget{
  const ManageNotification({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Material(
      color: AppColors.lightBackColor.withOpacity(0.8),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// notification button
                Padding(
                  padding:  EdgeInsets.only(top: Dimension.height10),
                  child: InkWell(
                    onTap: null,
                    borderRadius: BorderRadius.circular(Dimension.height50),
                    child: Stack(
                      children: [
                        Ink(
                          height: Dimension.height48,
                          width: Dimension.height48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                            border: Border.all(
                              width: 1.0,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppImages.bellImg),
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Container(
                            height: Dimension.fontSize12,
                            width: Dimension.fontSize12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.redBorderColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                 SizedBox(width: Dimension.width16),
                Padding(
                  padding:  EdgeInsets.only(top: Dimension.height16),
                  child: InkWell(
                    onTap: null,
                    borderRadius: BorderRadius.circular(Dimension.height50),
                    child: Ink(
                      height: Dimension.height48,
                      width: Dimension.height48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: Dimension.width16),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: Dimension.height63, right: Dimension.height80),

              child: SizedBox(
               // height: ResponsiveWidget.isSmallScreen(context) ? height * 0.2 : height * 0.35,
                width: width,
                child: Image.asset(
                  AppImages.upperArrowForNotificationImg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(padding:  EdgeInsets.only(left: Dimension.height89, ),
            child: Container(
              width: width,
                transform: Matrix4.translationValues(5, -10, 0),
                child: SmallText(text: manageYouNotificationText, textColor: AppColors.whiteColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height:  Dimension.height177),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimension.height102,
                  child: AppButton(onTap: (){Get.back();},
                    btnText:skipText,
                    borderColor: AppColors.lightBlueColor,
                    btnBackgroundColor: AppColors.whiteColor,
                    btnTextColor: AppColors.lightBlueColor,
                    height: Dimension.height48,
                  ),
                ),
                SizedBox(width: Dimension.width16,),
                SizedBox(
                  width: Dimension.height102,
                  child: AppButton(onTap: (){
                    Get.back();
                    Get.dialog(const ManageProfileScreen(),barrierDismissible: false);

                  },
                    btnText: nextBtnText,
                    btnTextColor: AppColors.whiteColor,
                    height: Dimension.height48,

                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }

}