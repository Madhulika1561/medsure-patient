

import 'package:get/get.dart';
import 'package:medsure_patient/helper/dialog/call_dialog.dart';

class CallController extends GetxController{


  Future openCallDialog(){
    return Get.dialog(const CallDialog());
  }

}