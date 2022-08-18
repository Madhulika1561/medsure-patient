

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/dialog/logout_dialog.dart';
import 'package:medsure_patient/helper/sharedPrefernce/shared_preference.dart';

import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/accountInfo/personalInfo/privacy_policy_screen.dart';
import 'package:medsure_patient/screens/accountInfo/personalInfo/term_condition_screen.dart';
import 'package:medsure_patient/widget/account_info_widget.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class AccountInfoScreen extends StatefulWidget{
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  _AccountInfoScreenState createState() =>_AccountInfoScreenState();

}

class _AccountInfoScreenState extends State<AccountInfoScreen>{
  String firstName='',lastName='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserSharedPreference.getUserFirstName().then((value) {setState(() {
      firstName=value.toString();
    });});
    UserSharedPreference.getUserLastName().then((value) {setState(() {
      lastName=value.toString();
    });});
  }

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
            child: BigText(text: accountInformationText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimension.height50,),
            Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20),
            child:  AccountInfoWidget(firstName,lastName),)

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: Dimension.height120,
        width: Dimension.screenWidth,
        margin:  EdgeInsets.only(left: Dimension.width20, right: Dimension.width20, bottom: Dimension.height40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(()=>const TermsConditionScreen());
              },
                child: SmallText(text: termsText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w400)),
            SizedBox(height: Dimension.height16,),
            GestureDetector(
                onTap: (){
                  Get.to(()=>const PrivacyPolicyScreen());
                },
                child: SmallText(text: privacyText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w400)),
            SizedBox(height: Dimension.height16,),
            GestureDetector(
              onTap: (){
                Get.dialog(const LogoutDialog());
              },
                child: SmallText(text: logoutText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }



}