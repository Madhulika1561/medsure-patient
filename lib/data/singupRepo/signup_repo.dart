

import 'package:get/get.dart';
import 'package:medsure_patient/data/api/api_client.dart';
import 'package:medsure_patient/data/apiContent.dart';

class SignupRepo extends GetxService{
  final ApiClient apiClient;

  SignupRepo({required this.apiClient});

  Future<Response> getSingUpData() async{
   return await apiClient.getData(ApiContent.baseUrl+ApiContent.registerApi);
  }


}