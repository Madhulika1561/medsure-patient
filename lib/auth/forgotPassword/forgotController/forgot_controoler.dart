
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/string.dart';

class ForgotPasswordController extends GetxController{

  final editUserName = TextEditingController();
  final forgotPassGlobalKey = GlobalKey<FormState>();

  String? validateForgotPassEmail(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterEmail;
    }else if(!Common().emailValidation(value.toString())){
      return pleaseEnterValidEmail;
    }else{
      return null;
    }
  }

}