

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/auth/splash/splashController/splash_controller.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/medsure_text.dart';

class SplashScreen extends StatelessWidget{
   SplashScreen({Key? key}) : super(key: key);
  SplashController controller = Get.put(SplashController());

   @override
   Widget build(BuildContext context) {
     // TODO: implement build
     return  Scaffold(
       backgroundColor: Colors.white,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children:  [
           Center(child: SvgPicture.asset(AppImages.appLogoIcon,height: Dimension.height63,))
         ],

       ),
     );
   }

}
/*
class _SplashScreenState extends State<SplashScreen>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
           Center(child: SvgPicture.asset(AppImages.appLogoIcon,height: Dimension.height63,))
        ],

      ),
    );
  }

}*/
