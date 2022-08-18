

import 'package:get/get.dart';
import 'package:medsure_patient/screens/home/home_controller/connectivity_controller.dart';

class NetworkBinding extends Bindings{
  @override
  void dependencies() {
    ///connectivity
    Get.lazyPut(() => ConnectivityController());
  }

}