
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/string.dart';

class SingUpController extends GetxController{

 // final SignupRepo? signupRepo;
 // SingUpController({this.signupRepo});

  List<dynamic> _signUpList =[];
  List<dynamic> get signUpList=>_signUpList;
  late TextEditingController editFirstName,editLastName,editEmail,editMobileNum,editPassword,editDateInput,
  editAddress,editCity,editState,editPassCode,editCountry;
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  RxBool isPassHide = true.obs;
  RxBool isLoading = false.obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    editFirstName   = TextEditingController();
    editLastName    = TextEditingController();
    editEmail       = TextEditingController();
    editMobileNum   = TextEditingController();
    editPassword    = TextEditingController();
    editDateInput   = TextEditingController();
    editAddress     = TextEditingController();
    editCity        = TextEditingController();
    editState       = TextEditingController();
    editPassCode    = TextEditingController();
    editCountry     = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    editFirstName.dispose();editLastName.dispose();editEmail.dispose();editMobileNum.dispose();
    editPassword.dispose();editDateInput.dispose();editAddress.dispose();editCity.dispose();
    editState.dispose();editPassCode.dispose();editCountry.dispose();
  }

  String? validateName(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterFirstName;
    }else{
      return null;
    }
  }
  String? validateLastName(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterLastName;
    }else{
      return null;
    }
  }
  String? validateSingUpEmail(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterEmail;
    }else if(!Common().emailValidation(value.toString())){
      return pleaseEnterValidEmail;
    }else{
      return null;
    }
  }
  String? validateSingUpPassword(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterPassword;
    }else if(!Common().passwordValidation(value.toString())){
      return pleaseEnterValidPassword;
    }else{
      return null;
    }
  }
  String? validateSingUpMobile(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterMobileNum;
    }else if(value.toString().trim().length<6 || value.toString().trim().length>10){
      return pleaseEnterValidMobileNum;
    }else{
      return null;
    }
  }
  String? validateSingUpDOB(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterDateOfBirth;
    }else{
      return null;
    }
  }

  String? validateSingUpAddress(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterAddress;
    }else{
      return null;
    }
  }
  String? validateSingUpCity(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterCity;
    }else{
      return null;
    }
  }
  String? validateSingUpState(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterState;
    }else{
      return null;
    }
  }
  String? validateSingUpPostalCode(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterPasscode;
    }else if(value.toString().trim().length<6){
      return pleaseEnterValidPasscode;
    }else{
      return null;
    }
  }
  String? validateSingUpCountry(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterCountry;
    }else{
      return null;
    }
  }

  /*Future<void> getSignUpResponse() async{
    Response response = await signupRepo!.getSingUpData();
    try{
      if(response.statusCode==200){
        _signUpList=[];
        update();

      }

    }catch(e){
     print(e.toString());
    }
  }*/

   void loading()async{
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
  }

}