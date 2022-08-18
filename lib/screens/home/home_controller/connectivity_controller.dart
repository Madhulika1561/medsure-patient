

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/helper/dialog/connectivity_dialog.dart';

class ConnectivityController extends GetxController{


  int connectionType = 0;

  final Connectivity connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getConnectionType();
    streamSubscription = connectivity.onConnectivityChanged.listen(updateState);
  }

  Future<void> getConnectionType() async{
    var connectivityResult;
    try{
      connectivityResult = await (connectivity.checkConnectivity());

    }on PlatformException catch(e){
       print(e.toString());
    }
    return updateState(connectivityResult);
  }



  Future<void> updateState(ConnectivityResult result)async {

     switch(result){
       case ConnectivityResult.wifi:
             connectionType=1;
             update();
             break;

       case ConnectivityResult.mobile:
            connectionType=2;
            update();
            break;
       case ConnectivityResult.none:
            connectionType=0;
            update();
            break;
       default: Get.dialog(const ConnectivityDialog());
     }
  }

}