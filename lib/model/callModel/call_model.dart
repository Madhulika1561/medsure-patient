


class CallModel{

  List<CallDataList>? data;

  CallModel({this.data});

  CallModel.fromJson(Map<String,dynamic> json){
    if(json["data"]!=null){
      data = <CallDataList>[];
      json["data"].forEach((v){
        data!.add(CallDataList.fromJson(v));
      });
    }

  }



}

class CallDataList{
  String? firstName;
  int? phoneNumber;

  CallDataList({this.firstName,this.phoneNumber});


  CallDataList.fromJson(Map<String,dynamic> json){
    firstName = json['first_name'];
    phoneNumber = json['phone_number'];
  }
}

