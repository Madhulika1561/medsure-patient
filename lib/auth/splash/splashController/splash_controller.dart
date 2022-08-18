

import 'dart:async';

import 'package:get/get.dart';
import 'package:medsure_patient/auth/login/login_screen.dart';
import 'package:medsure_patient/bottom_screen/bottom_nav_bar.dart';
import 'package:medsure_patient/helper/routerHelper/router_helper.dart';
import 'package:medsure_patient/helper/sharedPrefernce/shared_preference.dart';


class SplashController extends GetxController{

@override
  Future<void> onInit() async{
    super.onInit();
    startTime();
  }

   startTime() async {
   var duration = const Duration(seconds: 3);
   return Timer(duration,navigatePage);
  }

  void navigatePage(){
    Future status =  UserSharedPreference.getUserIsLogged();
    status.then((data) {
      if(data==true){
        return Get.to(()=>const BottomNavBarPage());
      }else{
        return Get.to(const LogInScreen());
      }
    } );
  }


}