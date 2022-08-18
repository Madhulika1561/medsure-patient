

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medsure_patient/dataService/apiContent.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/helper/dialog/server_error_dialog.dart';
import 'package:medsure_patient/helper/routerHelper/router_helper.dart';
import 'package:medsure_patient/helper/sharedPrefernce/shared_preference.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/accountInfo/account_info_screen.dart';
import 'package:medsure_patient/screens/accountInfo/editProfile/editProfileController/edit_profile_controller.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/back_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget{
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>_EditProfileScreenState();

}
class _EditProfileScreenState extends State<EditProfileScreen>{
  late Map _map;
  final EditProfileController editProfileController = Get.put(EditProfileController());
  final editProfileGlobalKey = GlobalKey<FormState>();
  String genderType ="Male";
  int id =0,_id=0;
  String firstName='',lastName='',gender='',dob='',address='',city='',state='',country='';
  int phoneNumber=0,postal_code=0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserSharedPreference.getUserId().then((value) {setState(() {
      _id = value!;
      print(_id);
    });});
    UserSharedPreference.getUserFirstName().then((value) {setState(() {editProfileController.editFirstName.text=value.toString();});});
    UserSharedPreference.getUserLastName().then((value) {setState(() {editProfileController.editLastName.text=value.toString();});});

    UserSharedPreference.getUserGender().then((value) {setState(() {gender=value.toString();});});
    UserSharedPreference.getUserDOB().then((value) {setState(() {editProfileController.editDateInput.text=value.toString();});});

    UserSharedPreference.getUserAddress().then((value) {setState(() {editProfileController.editAddress.text=value.toString();});});
    UserSharedPreference.getUserCity().then((value) {setState(() {editProfileController.editCity.text=value.toString();});});

    UserSharedPreference.getUserState().then((value) {setState(() {editProfileController.editState.text=value.toString();});});
    UserSharedPreference.getUserCountry().then((value) {setState(() {editProfileController.editCountry.text=value.toString();});});

    UserSharedPreference.getUserPinCode().then((value) {setState(() {editProfileController.editPinCode.text=value.toString();print(editProfileController.editPinCode.text);});});
    UserSharedPreference.getUserMobileNum().then((value) {setState(() {editProfileController.editMobileNum.text=value.toString();});});
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                  TextFormField(
                    controller: editProfileController.editFirstName,
                    style: GoogleFonts.inter(
                      fontSize: Dimension.fontSize16,
                      color: AppColors.lightGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    decoration: Common().getInputDecoration(hintText: firstName.toString()==""?enterFirstNameText:firstName.toString()),
                    validator: (value){
                      return editProfileController.validateEditFirstName(value.toString());
                    },
                  )
                ],
              ),),
              ///last name
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: lastNameText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    TextFormField(
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
                    )
                  ],
                ),),

              ///mobile
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: mobileNumText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    TextFormField(
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
                    )
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
                              genderType = 'M';
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
                              genderType = 'F';
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
                              genderType = 'O';
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
                    TextFormField(
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
                  ],
                ),),
              ///address
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: addressText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    TextFormField(
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
                    )
                  ],
                ),),
              ///city
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: cityText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    TextFormField(
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
                    )
                  ],
                ),),
              ///mobile
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: postalCodeText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    TextFormField(
                      controller: editProfileController.editPinCode,
                      style: GoogleFonts.inter(
                        fontSize: Dimension.fontSize16,
                        color: AppColors.lightGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(6)
                      ],
                      decoration: Common().getInputDecoration(hintText: "Post Code"),
                      validator: (value){
                        return editProfileController.validateEditPinCode(value.toString());
                      },
                    )
                  ],
                ),),
              ///state
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: stateText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    TextFormField(
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
                    )
                  ],
                ),),
              ///country
              Padding(padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: countryText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
                    SizedBox(height: Dimension.height08,),
                    TextFormField(
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
                    )
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
            getEditResponse(editProfileController.editFirstName.text.trim(),editProfileController.editLastName.text.trim(),
                editProfileController.editMobileNum.text.trim(),editProfileController.editCity.text.trim(),editProfileController.editState.text.trim(),
                editProfileController.editPinCode.text.trim(),editProfileController.editCountry.text.trim(),editProfileController.editAddress.text.trim());

          }

        },
          btnText: saveBtnText,
          btnTextColor: AppColors.whiteColor,
          height: Dimension.height48,

        ),
      ),
    );
  }


  Future<void> getEditResponse(String name,String lastName,String phoneNum,String city,String state, String pinCode,String country, String address) async{
    Common.showLoading(message: "Loading..");
   _map ={
    firstNameApiConsText:name.toString() ,lastNameApiConsText:lastName.toString(),phoneNumberApiConsText:phoneNum.toString() ,genderApiConsText:genderType.toString() ,
     cityApiConsText:city.toString() ,stateApiConsText:state.toString() ,pinCodeApiConsText:pinCode.toString() ,countryApiConsText:country.toString(),
     "Address":address.toString()
   };
   print(_map);

   try{
     var url = Uri.parse(ApiContent.baseUrl+ApiContent.commonApiTag+ApiContent.editProfileApi+_id.toString());
     var mapHeaders = {
       'Content-Type':'application/json',
       'accept':'application/json'
     };
     var response = await http.put(url,body: jsonEncode(_map),headers: mapHeaders);
     print("response...${json.decode(response.body)}");
     if(response.statusCode==ApiContent.statusCode200){
       var mapConverter = json.decode(response.body);
       var status = (mapConverter["status"]==null)?"":mapConverter["status"];
       var message = (mapConverter["message"]==null)?"":mapConverter["message"];

       if(status.toString()=="successful"){
         Common.hideLoading();
         Common.showToastMessage(message.toString());
         Get.to(const AccountInfoScreen());
         UserSharedPreference.setUserFirstName(name.toString());
         UserSharedPreference.setUserLastName(lastName.toString());
         UserSharedPreference.setUserMobileNum(int.parse(phoneNum));
         UserSharedPreference.setUserGender(genderType.toString());
         UserSharedPreference.setUserAddress(address.toString());
         UserSharedPreference.setUserCity(city.toString());
         UserSharedPreference.setUserState(state.toString());
         UserSharedPreference.setUserCountry(country.toString());
         UserSharedPreference.setUserPinCode(int.parse(pinCode));
       }else{
         Common.hideLoading();
       }


     }else{

     }
   }on PlatformException catch(e){
     Common.hideLoading();
     Get.dialog(ServerErrorDialog(errorText:e.toString()));
   }



  }
}