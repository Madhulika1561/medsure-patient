
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/data/singupRepo/signup_repo.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/string.dart';

class SingUpController extends GetxController{

 // final SignupRepo? signupRepo;
 // SingUpController({this.signupRepo});

  List<dynamic> _signUpList =[];
  List<dynamic> get signUpList=>_signUpList;

  TextEditingController editFirstName = TextEditingController();
  TextEditingController editLastName = TextEditingController();
  TextEditingController editEmail = TextEditingController();
  TextEditingController editMobileNum = TextEditingController();
  TextEditingController editPassword = TextEditingController();
  TextEditingController editDateInput = TextEditingController();
  TextEditingController editAddress = TextEditingController();
  TextEditingController editCity = TextEditingController();
  TextEditingController editState = TextEditingController();
  TextEditingController editPassCode = TextEditingController();
  TextEditingController editCountry = TextEditingController();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  RxBool isPassHide = true.obs;
  RxBool isLoading = false.obs;


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