

import 'package:get/get.dart';
import 'package:medsure_patient/auth/login/login_screen.dart';
import 'package:medsure_patient/auth/splash/splashScreen.dart';
import 'package:medsure_patient/screens/accountInfo/account_info_screen.dart';

class RouterHelper {
  static const String initial ="/";
  static const String login ="/login-screen";
  static const String accountInformation = "/account-information";

  static String getLoginScreen()=>login;
  static String getAccountInformation()=>accountInformation;


  static List<GetPage> routes =[
    GetPage(name: "/", page:()=> SplashScreen()),
    GetPage(name: login, page:(){return const LogInScreen();}),
    GetPage(name: accountInformation, page:(){return const AccountInfoScreen();})
  ];

}