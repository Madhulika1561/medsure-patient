
import 'package:get/get.dart';
import 'package:medsure_patient/auth/singup/singupController/singup_controller.dart';
import 'package:medsure_patient/data/api/api_client.dart';
import 'package:medsure_patient/data/apiContent.dart';
import 'package:medsure_patient/data/singupRepo/signup_repo.dart';

Future<void> init() async{
   //api client
   Get.lazyPut(() => ApiClient(appBaseUrl: ApiContent.baseUrl));
   //repo
   Get.lazyPut(() => SignupRepo(apiClient: Get.find()));
   //controller
  //Get.lazyPut(() => SingUpController(signupRepo: Get.find()));
   
}