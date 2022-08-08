

import 'package:get/get.dart';
import 'package:medsure_patient/auth/login/login_screen.dart';
import 'package:medsure_patient/auth/splash/splashScreen.dart';

class RouterHelper {
  static const String initial ="/";
  static const String login ="/login-screen";

  static String getLoginScreen()=>'$login';


  static List<GetPage> routes =[
    GetPage(name: "/", page:()=> SplashScreen()),
    GetPage(name: login, page:(){return const LogInScreen();})
  ];

}