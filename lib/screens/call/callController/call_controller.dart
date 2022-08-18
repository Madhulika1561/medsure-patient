

import 'package:get/get.dart';
import 'package:medsure_patient/dataService/repository/call_repo.dart';
import 'package:medsure_patient/helper/dialog/call_dialog.dart';
import 'package:medsure_patient/model/callModel/call_model.dart';

class CallController extends GetxController{

  final CallRepo callRepo;

  CallController({required this.callRepo});

  List<CallDataList> _callList =[];
  List<CallDataList> get callList =>_callList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCallPageResponse(String id)async {
    Response response = await callRepo.getCallPageList(id);
    if(response.statusCode==200){
      print("got list");
      _callList=[];
      _callList.addAll(CallModel.fromJson(response.body).data!);
      _isLoading = true;
      update();
    }else{
      _isLoading = false;
    }


  }



}