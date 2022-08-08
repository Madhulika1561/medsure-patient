

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/helper/dialog/gotIt_dialog.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';


class ManageProfileScreen extends StatelessWidget {
  const ManageProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding:  EdgeInsets.only(top: Dimension.height10),
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
                /// profile button
                Padding(
                  padding:  EdgeInsets.only(top: Dimension.height10),
                  child: InkWell(
                    onTap: null,
                    borderRadius: BorderRadius.circular(Dimension.height50),
                    child: Ink(
                      height: Dimension.height48,
                      width: Dimension.height48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF87B4D1),
                      ),
                      child: Center(
                        child: Text(
                          'MJ',
                          style: GoogleFonts.comfortaa(
                            fontSize: Dimension.fontSize20,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                 SizedBox(width: Dimension.height08),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: Dimension.height63, right: Dimension.height32),
              child: SizedBox(
                width: width,
                child: Image.asset(
                  AppImages.bottomArrowForNotificationImg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(padding:  EdgeInsets.only(left: Dimension.height89, ),
              child: Container(
                  width: width,
                  transform: Matrix4.translationValues(5, -10, 0),
                  child: SmallText(text: "MANAGE YOUR PROFILE &\nOTHER INFORMATION", textColor: AppColors.whiteColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700)),
            ),
            SizedBox(height:  Dimension.height177),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimension.height102,
                  child: AppButton(onTap: (){Get.back();},
                    btnText: "Skip",
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
                    Get.dialog(const GotItDialog(),barrierDismissible: false);

                  },
                    btnText: "Next",
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
