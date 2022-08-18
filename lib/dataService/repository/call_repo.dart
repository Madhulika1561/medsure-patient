


import 'package:get/get.dart';
import 'package:medsure_patient/dataService/api/api_client_api.dart';
import 'package:medsure_patient/dataService/apiContent.dart';

class CallRepo extends GetxService{

  final ApiClient apiClient;

  CallRepo({required this.apiClient});

  Future<Response> getCallPageList(String id)async{

    return await apiClient.getData(ApiContent.commonApiTag+ApiContent.callingApi+id);

  }
}