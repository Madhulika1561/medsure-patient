

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/dataService/apiContent.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/helper/dialog/call_dialog.dart';
import 'package:medsure_patient/helper/dialog/server_error_dialog.dart';
import 'package:medsure_patient/helper/sharedPrefernce/shared_preference.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_icons.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';
import 'package:http/http.dart' as http;

class CallScreen extends StatefulWidget{
   const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  int _id=0;
  var name,number;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserSharedPreference.getUserId().then((value) {setState(() {
      _id = value!;
      print(_id);
      getCallResponse(_id);
    });});



    //Get.find<CallController>().getCallPageResponse(_id.toString());
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0.0,
        //leading: SizedBox(),
        //leadingWidth: 60.0,
        centerTitle: false,
        title: BigText(text: callText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
      ),
      body: Stack(
        children: [
         /* GetBuilder<CallController>(builder: (callData){
            return  callData.isLoading?Container(
              width: Dimension.screenWidth,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,

              ),
              child: ListView.builder(
                  itemCount: callData.callList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index)=>buildShowModelUI(callData.callList[index])),
            ):const CircularProgressIndicator(color: AppColors.lightBlueColor,);
          })*/
          Container(
            width: Dimension.screenWidth,
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,

            ),
            child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildShowModelUI()),
          )


        ],
      ),
    );
  }

  Widget buildShowModelUI()=>Container(
    width: Dimension.screenWidth,
    padding: EdgeInsets.only(top:Dimension.height16),

    child: ListTile(
     trailing: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.lightBlackColor,size: Dimension.height16,),
     leading: AppCircleImages(icon: Icons.call, iconColor:AppColors.whiteColor,iconSize: Dimension.height20, size: Dimension.height48,backgroundColor: AppColors.lightBlueColor,shadowColor: AppColors.miniLightBlueColor.withOpacity(0.2),),
     title: BigText(text: name.toString()==""?pmcText: name.toString(), textColor: AppColors.blackColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
     subtitle: Padding(
         padding: EdgeInsets.only(left: 0,right: Dimension.width10,top: Dimension.height08),
         child: SmallText(text:  number.toString()==null?yourPmcText:number.toString(), textColor: AppColors.lightBlackColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w500)),
     onTap: (){
       Get.dialog(const CallDialog());
     },
        ),
  );

  Future<void> getCallResponse(int id) async{

    Common.showLoading(message: "Loading..");

    try{
      var url = Uri.parse(ApiContent.baseUrl+ApiContent.commonApiTag+ApiContent.callingApi+id.toString());
      var mapHeaders = {
        'Content-Type':'application/json',
        'accept':'application/json'
      };
      var response = await http.get(url, headers: mapHeaders);
      if(response.statusCode ==200){
        final data = json.decode(response.body);
        Common.hideLoading();



        setState(() {
          name = (data["first_name"]==null)?"":data["first_name"];
          number = (data['phone_number']==null)?"":data['phone_number'];

          print('$name, $number');
        });


      }else{
        Common.hideLoading();
      }

    }on PlatformException catch(e){
      Common.hideLoading();
      Get.dialog(ServerErrorDialog(message: e.toString(),));
    }

  }



}