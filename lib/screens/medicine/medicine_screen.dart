

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/medicine/medicineController/medicine_controller.dart';
import 'package:medsure_patient/widgetHelper/app_icons.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/itemRowWidget.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class MedicineScreen extends StatelessWidget{
   MedicineScreen({Key? key}) : super(key: key);
  final MedicineController medicineController = Get.put(MedicineController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child: Padding(
          padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54,bottom: Dimension.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeaderUI(),
              SizedBox(height: Dimension.height10,),
              Expanded(child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context,index)=>buildMedicineListUI()))


            ],
          ),
        ),
      )
    );
  }
  Widget buildHeaderUI() =>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BigText(text:  yourMedicineText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
      SizedBox(height: Dimension.height48,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              medicineController.isPrevFun();
              print("previous");
            },
              child: AppCircleImages( icon: Icons.arrow_back_ios_new, size: Dimension.height40, iconSize: Dimension.fontSize18,backgroundColor: AppColors.lightActiveFieldBorderColor,iconColor: AppColors.whiteColor,)),
          SmallText(text: medicineController.isNext.value==false?"05-27-2022" : "05-28-2022", textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize20, fontWeight: FontWeight.w700),
          InkWell(
              onTap: (){
                medicineController.isNextFun();
                print("next");
              },
              child: AppCircleImages( icon: Icons.arrow_forward_ios_outlined, size: Dimension.height40, iconSize: Dimension.fontSize18,backgroundColor: AppColors.lightActiveFieldBorderColor,iconColor: AppColors.whiteColor,))

        ],
      )
    ],
  );

  Widget buildMedicineListUI()=>medicineController.isNext.value==false?
  Container(
    width: Dimension.screenWidth,
    padding: EdgeInsets.only(left: Dimension.width16,right: Dimension.width16,top: Dimension.height16,bottom: Dimension.height16),
    margin: EdgeInsets.only(top: Dimension.height20,right: Dimension.width20,left: Dimension.width20),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(4.0),
      boxShadow:  [BoxShadow(color: AppColors.shadowColor.withOpacity(0.2),offset: const Offset(0.0,4.0),blurRadius: 5.0),]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallText(text: timeText, textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w500),
        SizedBox(height: Dimension.height10,),
        SmallText(text: beforeFoodText, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500),
        SizedBox(height: Dimension.height10,),
        Divider(color: AppColors.lightGreyColor.withOpacity(0.2),thickness: 1,),
        SizedBox(height: Dimension.height14,),
        InkWell(
          onTap: (){
            medicineController.showDetailsPage();
          },
          child: Column(
            children: [
               ItemRowWidget(itemName: rosuvastatineText, itemWeight: gram20Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14,),
              SizedBox(height: Dimension.height10,),
               ItemRowWidget(itemName: farxigaText, itemWeight: gram10Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14,),
              SizedBox(height: Dimension.height10,),
               ItemRowWidget(itemName: brilintaText, itemWeight: gram90Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14),
              SizedBox(height: Dimension.height10,),
               ItemRowWidget(itemName: aspirinText, itemWeight: gram80Text,icon: Icons.arrow_forward_ios_outlined,textSize: Dimension.fontSize14,),
            ],
          ),
        ),

      ],
    ),
  ):Expanded(
    child: SizedBox(
      width: Dimension.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmallText(text: "", textColor: AppColors.blackColor.withOpacity(0.2), textSize: Dimension.fontSize20, fontWeight: FontWeight.w700),
          SizedBox(height: Dimension.height16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimension.height16),
            child: Text(
              'You don’t have any medicines for this day',
              textAlign: TextAlign.center,
              style: GoogleFonts.comfortaa(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: AppColors.hintTextColor,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    ),
  );

}