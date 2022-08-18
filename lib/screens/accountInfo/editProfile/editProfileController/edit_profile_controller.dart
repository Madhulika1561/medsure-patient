


import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/string.dart';

class EditProfileController extends GetxController{

  late TextEditingController editFirstName,editLastName,editMobileNum,editDateInput,editPinCode,
  editAddress,editCity,editState,editCountry;


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
  String? validateEditPinCode(String value){
    if(value.toString().trim().isEmpty){
      return "Please enter the pin code";
    }else if(value.toString().trim().length<4){
      return "Please enter the valid pin code";
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    editFirstName  = TextEditingController();
    editLastName   = TextEditingController();
    editMobileNum  = TextEditingController();
    editDateInput  = TextEditingController();
    editAddress    = TextEditingController();
    editCity       = TextEditingController();
    editState      = TextEditingController();
    editPinCode    = TextEditingController();
    editCountry    = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    editFirstName.dispose();
    editLastName.dispose();
    editMobileNum.dispose();
    editDateInput.dispose();
    editAddress.dispose();
    editCity.dispose();
    editState.dispose();
    editPinCode.dispose();
    editCountry.dispose();

  }


}