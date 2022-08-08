import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medsure_patient/auth/splash/splashScreen.dart';
import 'package:medsure_patient/helper/routerHelper/router_helper.dart';
import 'package:medsure_patient/helper/sharedPrefernce/shared_preference.dart';
import 'helper/dependeci/dependeci.dart' as dep;


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await dep.init();
   await UserSharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      /*theme: ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      debugShowCheckedModeBanner: false,

      home:  SplashScreen(),
      initialRoute: RouterHelper.initial,
      getPages: RouterHelper.routes,
    );
  }
}

