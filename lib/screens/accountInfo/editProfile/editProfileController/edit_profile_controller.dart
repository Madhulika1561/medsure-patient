


import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/string.dart';

class EditProfileController extends GetxController{

  final editFirstName = TextEditingController();
  final editLastName = TextEditingController();
  final editEmail = TextEditingController();
  final editMobileNum = TextEditingController();
  final editPassword = TextEditingController();
  final editDateInput = TextEditingController();
  final editAddress = TextEditingController();
  final editCity = TextEditingController();
  final editState = TextEditingController();
  final editCountry = TextEditingController();

  RxBool isEditPassHide = true.obs;

  String? validateEditFirstName(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterFirstName;
    }else{
      return null;
    }
  }
  String? validateEditLastName(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterLastName;
    }else{
      return null;
    }
  }
  String? validateEditEmail(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterEmail;
    }else if(!Common().emailValidation(value.toString().trim())){
      return pleaseEnterValidEmail;
    }else{
      return null;
    }
  }
  String? validateEditMobileNum(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterMobileNum;
    }else if(value.toString().trim().length<6){
      return pleaseEnterValidMobileNum;
    }else{
      return null;
    }
  }
  String? validateEditPassword(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterPassword;
    }else if(!Common().passwordValidation(value.toString().trim())){
      return pleaseEnterValidPassword;
    }else{
      return null;
    }
  }
  String? validateEditDOB(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterDateOfBirth;
    }else{
      return null;
    }
  }
  String? validateEditAddress(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterAddress;
    }else{
      return null;
    }
  }
  String? validateEditState(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterState;
    }else{
      return null;
    }
  }
  String? validateEditCity(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterCity;
    }else{
      return null;
    }
  }
  String? validateEditCountry(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterCountry;
    }else{
      return null;
    }
  }


}