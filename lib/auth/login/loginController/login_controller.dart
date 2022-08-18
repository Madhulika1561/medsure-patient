

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/string.dart';


class LoginController extends GetxController{
  late TextEditingController editEmailController,editPasswordController;



  RxBool isPassHide = true.obs;



  String? validateLoginEmail(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterEmail;
    }else if(!Common().emailValidation(value.toString())){
      return pleaseEnterValidEmail;
    }else{
      return null;
    }
  }

  String? validateLoginPassword(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterPassword;
    }
    /*else if(!Common().passwordValidation(value.toString())){
      return pleaseEnterValidPassword;
    }*/
    else{
      return null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    editEmailController     = TextEditingController();
    editPasswordController = TextEditingController();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    editEmailController.dispose();
    editPasswordController.dispose();

  }



}