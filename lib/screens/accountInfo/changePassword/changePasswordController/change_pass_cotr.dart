
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/string.dart';

class ChangePassController extends GetxController{

  TextEditingController editOldPassword = TextEditingController();
  TextEditingController editNewPassword = TextEditingController();
  TextEditingController editConfirmPassword = TextEditingController();

  GlobalKey<FormState> changeGlobalKey = GlobalKey<FormState>();

  RxBool isHidePass = true.obs;
  RxBool isHideNewPass = true.obs;
  RxBool isHideRePass = true.obs;

  String? validateChangeOldPass(String value){
    if(value.toString().trim().isEmpty){
      return "Please enter the old password,You have registered";
    }else if(!Common().passwordValidation(value.toString())){
      return 'Please enter valid old password';
    }else{
      return null;
    }
  }

  String? validateChangePassPassword(String value){
    if(value.toString().trim().isEmpty){
      return "Please enter the new password";
    }else if(!Common().passwordValidation(value.toString())){
      return "Please enter the valid new password";
    }else{
      return null;
    }
  }
  String? validateChangeRePassPassword(String value){
    if(value.toString().trim().isEmpty){
      return "Please enter the re-enter password";
    }else if(!Common().passwordValidation(value.toString())){
      return "Please enter the valid re-enter password";
    }else{
      return null;
    }
  }

  final editUserName = TextEditingController();


  String? validateResetPassEmail(String value){
    if(value.toString().trim().isEmpty){
      return pleaseEnterEmail;
    }else if(!Common().emailValidation(value.toString())){
      return pleaseEnterValidEmail;
    }else{
      return null;
    }
  }
}