
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/dialog/dose_missed_dialog.dart';
import 'package:medsure_patient/helper/dialog/dose_taken_dailog.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/accountInfo/account_info_screen.dart';
import 'package:medsure_patient/screens/home/home_controller/homeController.dart';
import 'package:medsure_patient/screens/notification/notification_screen.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/inter_font_text.dart';
import 'package:medsure_patient/widgetHelper/itemRowWidget.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class HomeScreen extends GetView<HomeController>{

   HomeScreen({Key? key}) : super(key: key);

   final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(text: helloNameText, textColor: AppColors.blackColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w700),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(()=>NotificationScreen());
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: Dimension.height48,
                                height: Dimension.height48,
                                decoration: const BoxDecoration(
                                    color:AppColors.whiteColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [BoxShadow(color: AppColors.lightLBGreyThreeColor,offset: Offset(0.0,5.0),blurRadius: 7.0)]
                                ),
                                child: Center(
                                  child: SvgPicture.asset(AppImages.bellImg,width: Dimension.height20,height: Dimension.height20,color: AppColors.hintTextColor,),
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    width: 12,
                                    height: 12,
                                    decoration: const BoxDecoration(
                                      color: AppColors.redBorderColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(width: Dimension.width16,),
                        InkWell(
                          onTap: (){
                            Get.to(()=>const AccountInfoScreen());
                          },
                          child: Container(
                            width: Dimension.height48,
                            height: Dimension.height48,
                            padding: const EdgeInsets.all(2.0),
                            decoration:  BoxDecoration(
                                color:AppColors.miniLightBlueColor,
                                borderRadius: BorderRadius.circular(Dimension.height40),
                                boxShadow: const [BoxShadow(color: AppColors.lightBlueColor,offset: Offset(0.0,1.0),blurRadius: 1.0)]
                            ),
                            child: Center(
                              child: BigText(text: sortNameText, textColor: AppColors.whiteColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),


                      ],
                    )
                  ],
                ),
                SizedBox(height: Dimension.height48,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SmallText(text: packetsText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize18, fontWeight: FontWeight.w700),
                          const SizedBox(height: 2.0,),
                          InterFontText(text: leftUnitText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400,align: TextAlign.left,),

                        ],
                      ),
                    ),
                    SvgPicture.asset(AppImages.pocketImg)

                  ],
                ),
                SizedBox(height: Dimension.height10,),
              ],

            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context,int index)=>homeListUI(),
                  ),
            )


          ],
        ),
      ),
    );
  }

  Widget homeListUI()=>Container(
    width: Dimension.screenWidth,
    padding: EdgeInsets.only(left: Dimension.width16,right: Dimension.width16,top: Dimension.height16,bottom: Dimension.height16),
    margin: EdgeInsets.only(top: Dimension.height13,right: Dimension.width20,left: Dimension.width20),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(4.0),
      boxShadow:  [BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: Offset(0.0,4.0),blurRadius: 5.0)]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(text: upcomingDoseText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
                SizedBox(height: Dimension.height10,),
                SmallText(text: takeWithFoodText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500),

              ],
            ),
            Row(
              children: [
                SmallText(text: timeText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w500)
              ],
            )
          ],
            ),
        SizedBox(height: Dimension.height10,),
         Divider(color: AppColors.lightGreyColor.withOpacity(0.2),thickness: 1,),
        SizedBox(height: Dimension.height14,),
        ItemRowWidget(itemName: rosuvastatineText, itemWeight: gram10Text,textSize: Dimension.fontSize14,),
        SizedBox(height: Dimension.height10,),
         ItemRowWidget(itemName: farxigaText, itemWeight: gram10Text,textSize: Dimension.fontSize14,),
        SizedBox(height: Dimension.height10,),
         ItemRowWidget(itemName: brilintaText, itemWeight: gram10Text,textSize: Dimension.fontSize14,),
        SizedBox(height: Dimension.height10,),
         ItemRowWidget(itemName: aspirinText, itemWeight: gram10Text,textSize: Dimension.fontSize14,),
        SizedBox(height: Dimension.height14,),
        Divider(color: AppColors.lightGreyColor.withOpacity(0.2),thickness: 1,),
        SizedBox(height: Dimension.height10,),
         SizedBox(width: Dimension.width10),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onTap: () {
                  Get.dialog(
                const DoseMissedDialog(),);
                },
                btnText: iDoNotTakeBtnText,
                height: Dimension.height48,
                btnBackgroundColor: AppColors.whiteColor,
                btnTextColor: AppColors.lightBlueColor,
              ),
            ),
            SizedBox(width: Dimension.width20,),
            Expanded(
              child: AppButton(
                onTap: () {
                  Get.dialog(
                    const DoseTakenDialog(),);
                },
                btnText: iTookBtnText,
                height: Dimension.height48,
                btnBackgroundColor: AppColors.lightBlueColor,
              ),
            ),
          ],
        )




      ],
    ),

  );

}