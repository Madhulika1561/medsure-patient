

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/accountInfo/account_info_screen.dart';
import 'package:medsure_patient/screens/accountInfo/editProfile/editProfileController/edit_profile_controller.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class EditProfileScreen extends StatefulWidget{
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_EditProfileScreenState();

}
class _EditProfileScreenState extends State<EditProfileScreen>{
  final EditProfileController editProfileController = Get.put(EditProfileController());
  final editProfileGlobalKey = GlobalKey<FormState>();
  String genderType ="Male";
  int id =0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void selectedDate() async{
    DateTime? pickedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2010), lastDate: DateTime(2030));

    if(pickedDate!=null){
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        editProfileController.editDateInput.text = formattedDate;
      });
    }else{

    }
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
        leading: const CustomBackButton(),
        title: Padding(
          padding: EdgeInsets.only(left: Dimension.width20,top: Dimension.height16,bottom: 5.0),
          child: BigText(text: editProfileText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: editProfileGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///first name
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: firstNameText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                  SizedBox(height: Dimension.height08,),
                  SizedBox(height: Dimension.height48,
                  child: TextFormField(
                    controller: editProfileController.editFirstName,
                    style: GoogleFonts.inter(
                      fontSize: Dimension.fontSize16,
                      color: AppColors.lightGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    decoration: Common().getInputDecoration(hintText: enterFirstNameText),
                    validator: (value){
                      return editProfileController.validateEditFirstName(value.toString());
                    },
                  ),)
                ],
              ),),
              ///last name
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: lastNameText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(height: Dimension.height48,
                      child: TextFormField(
                        controller: editProfileController.editLastName,
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        decoration: Common().getInputDecoration(hintText: enterLastNameText),
                        validator: (value){
                          return editProfileController.validateEditLastName(value.toString());
                        },
                      ),)
                  ],
                ),),
              ///email
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: emailIdText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(height: Dimension.height48,
                      child: TextFormField(
                        controller: editProfileController.editEmail,
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration: Common().getInputDecoration(hintText: enterEmailIdText),
                        validator: (value){
                          return editProfileController.validateEditEmail(value.toString());
                        },
                      ),)
                  ],
                ),),
              ///mobile
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: mobileNumText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(height: Dimension.height48,
                      child: TextFormField(
                        controller: editProfileController.editMobileNum,
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        decoration: Common().getInputDecoration(hintText: enterMobileNumText),
                        validator: (value){
                          return editProfileController.validateEditMobileNum(value.toString());
                        },
                      ),)
                  ],
                ),),
              ///password
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: passwordText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(
                      height: Dimension.height48,
                      child: TextFormField(
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: editProfileController.editPassword,
                        obscuringCharacter: "*",
                        obscureText: editProfileController.isEditPassHide.value,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16)
                        ],
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding:  EdgeInsets.only(left: Dimension.width20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimension.height10),
                              borderSide: const BorderSide(
                                color: AppColors.lightFieldBorderColor,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimension.height10),
                              borderSide: const BorderSide(
                                color: AppColors.lightActiveFieldBorderColor,
                                width: 1.0,
                              ),
                            ),
                            fillColor: AppColors.lightOrangeBackColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimension.height10),
                              borderSide: const BorderSide(
                                color: AppColors.lightActiveFieldBorderColor,
                                width: 1.0,
                              ),
                            ),
                            hintText: "Enter password",
                            hintStyle: GoogleFonts.inter(
                                fontSize: Dimension.fontSize16,
                                color: AppColors.lightGreyColor,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal
                            ),
                            suffixIcon: IconButton(
                              onPressed: (){

                                editProfileController.isEditPassHide.value = !editProfileController.isEditPassHide.value;



                              },
                              icon: Image.asset(editProfileController.isEditPassHide.value ? AppImages.eyeOpenIcon:AppImages.eyeCloseIcon,width: Dimension.height20,height: Dimension.height20,color: AppColors.lightGreyColor,),
                            )
                        ),
                        validator: (value){
                          return editProfileController.validateEditPassword(value.toString());
                        },


                      ),
                    ),
                  ],
                ),),
              ///gender
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: genderText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    Row(
                      children: [

                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              genderType = 'Male';
                              id = 1;
                            });
                          },
                        ),
                        Text(
                          'Male',
                          style: GoogleFonts.comfortaa(
                            color: context.theme.primaryColorDark,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: Dimension.width20,),
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              genderType = 'Female';
                              id = 2;
                              //print(radioButtonItem.toString());
                            });
                          },
                        ),
                        Text(
                          'Female',
                          style: GoogleFonts.comfortaa(
                            color: context.theme.primaryColorDark,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: Dimension.width20,),
                        Radio(
                          value: 3,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              genderType = 'Other';
                              id = 3;
                              //print(radioButtonItem.toString());
                            });
                          },
                        ),
                        Text(
                          'Other',
                          style: GoogleFonts.comfortaa(
                            color: context.theme.primaryColorDark,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),),
              ///DOB
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: dobText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(
                      height: Dimension.height48,
                      child: TextFormField(
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: editProfileController.editDateInput,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        enableInteractiveSelection: false,
                        readOnly: true,
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 16.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: AppColors.lightFieldBorderColor,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: AppColors.lightActiveFieldBorderColor,
                              width: 1.0,
                            ),
                          ),
                          fillColor: AppColors.lightOrangeBackColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: AppColors.lightActiveFieldBorderColor,
                              width: 1.0,
                            ),
                          ),
                          hintText: enterDOBText,
                          suffixIcon: const Icon(Icons.calendar_month,color: AppColors.lightBlueColor,),
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16.0,
                            color: AppColors.lightGreyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        validator: (value){
                          return editProfileController.validateEditDOB(value.toString());
                        },
                        onTap: (){
                          selectedDate();
                        },

                      ),
                    ),
                  ],
                ),),
              ///address
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: addressText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(height: Dimension.height48,
                      child: TextFormField(
                        controller: editProfileController.editAddress,
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: Common().getInputDecoration(hintText: enterFullAddressText),
                        validator: (value){
                          return editProfileController.validateEditAddress(value.toString());
                        },
                      ),)
                  ],
                ),),
              ///city
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: cityText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(height: Dimension.height48,
                      child: TextFormField(
                        controller: editProfileController.editCity,
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: Common().getInputDecoration(hintText: enterCityText),
                        validator: (value){
                          return editProfileController.validateEditCity(value.toString());
                        },
                      ),)
                  ],
                ),),
              ///state
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: stateText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(height: Dimension.height48,
                      child: TextFormField(
                        controller: editProfileController.editState,
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: Common().getInputDecoration(hintText: enterStateText),
                        validator: (value){
                          return editProfileController.validateEditState(value.toString());
                        },
                      ),)
                  ],
                ),),
              ///country
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: countryText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    SizedBox(height: Dimension.height48,
                      child: TextFormField(
                        controller: editProfileController.editCountry,
                        style: GoogleFonts.inter(
                          fontSize: Dimension.fontSize16,
                          color: AppColors.lightGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: Common().getInputDecoration(hintText: enterCountryText),
                        validator: (value){
                          return editProfileController.validateEditCountry(value.toString());
                        },
                      ),)
                  ],
                ),),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: Dimension.screenWidth,
        height: Dimension.height65,
        color: AppColors.whiteOneColor,
        padding: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30,top: Dimension.height10,bottom: Dimension.height10),
        child: AppButton(onTap: (){
          if(editProfileGlobalKey.currentState!.validate()){
            Get.to(const AccountInfoScreen());
          }

        },
          btnText: saveBtnText,
          btnTextColor: AppColors.whiteColor,
          height: Dimension.height48,

        ),
      ),
    );
  }

}