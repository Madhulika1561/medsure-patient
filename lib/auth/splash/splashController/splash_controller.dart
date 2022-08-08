

import 'dart:async';

import 'package:get/get.dart';

import 'package:medsure_patient/helper/routerHelper/router_helper.dart';


class SplashController extends GetxController{

@override
  Future<void> onInit() async{
    super.onInit();
    print("Splash");
    Timer(const Duration(seconds: 3), () =>Get.toNamed(RouterHelper.getLoginScreen()));
  }

}