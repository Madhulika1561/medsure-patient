

import 'package:get/get.dart';
import 'package:medsure_patient/dataService/api/api_client_api.dart';
import 'package:medsure_patient/dataService/apiContent.dart';


class SignupRepo extends GetxService{
  final ApiClient apiClient;

  SignupRepo({required this.apiClient});

  Future<Response> getSingUpData() async{
   return await apiClient.getData(ApiContent.baseUrl+ApiContent.registerApi);
  }


}