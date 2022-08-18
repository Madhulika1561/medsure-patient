
import 'package:get/get.dart';
import 'package:medsure_patient/dataService/api/api_client_api.dart';
import 'package:medsure_patient/dataService/apiContent.dart';
import 'package:medsure_patient/dataService/repository/call_repo.dart';
import 'package:medsure_patient/dataService/repository/signup_repo.dart';
import 'package:medsure_patient/screens/call/callController/call_controller.dart';
import 'package:medsure_patient/screens/home/home_controller/connectivity_controller.dart';


Future<void> init() async{
   ///api client
   Get.lazyPut(() => ApiClient(appBaseUrl: ApiContent.baseUrl));
   ///repo
   Get.lazyPut(() => SignupRepo(apiClient: Get.find()));
   Get.lazyPut(() => CallRepo(apiClient: Get.find()));

   ///controller
  Get.lazyPut(() => CallController(callRepo: Get.find()));


}