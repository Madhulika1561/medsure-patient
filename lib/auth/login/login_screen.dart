

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/auth/faceId_setup/finger_touch_setup.dart';
import 'package:medsure_patient/auth/forgotPassword/forgot_password_screen.dart';
import 'package:medsure_patient/auth/login/loginController/login_controller.dart';
import 'package:medsure_patient/auth/singup/sngup_screen.dart';
import 'package:medsure_patient/bottom_screen/bottom_nav_bar.dart';
import 'package:medsure_patient/bottom_screen/customBottomTextBar.dart';
import 'package:medsure_patient/dataService/apiContent.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/helper/dialog/server_error_dialog.dart';
import 'package:medsure_patient/helper/sharedPrefernce/shared_preference.dart';
import 'package:medsure_patient/model/loginModel/login_data.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/screens/home/home_controller/connectivity_controller.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/rich_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';
import 'package:http/http.dart' as http;

class LogInScreen extends StatefulWidget{
   const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late Map _map;

  List<LoginData> dataList = [];
  LoginController loginController = Get.put(LoginController());
  final ConnectivityController networkManager = Get.find<ConnectivityController>();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child: SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: login, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
                SizedBox(height: Dimension.height136,),
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                      onTap: (){
                        Get.to(()=>const FingerTouchSetup());
                      },
                      child: BigText(text: unlockWithFace, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700)),

                ),
                SizedBox(height: Dimension.height20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.lineIcon),
                    SizedBox(width: Dimension.width10,),
                    SmallText(text: orText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w700),
                    SizedBox(width: Dimension.width10,),
                    Image.asset(AppImages.lineIcon),
                  ],
                ),
                SizedBox(height: Dimension.height32,),
                buildUserNamePasswordUI(),

                SizedBox(height: Dimension.height08,),
                Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: (){
                          loginController.editEmailController.text="";
                          loginController.editPasswordController.text="";
                          Get.to(()=> ForgotPasswordScreen());
                        },
                        child: SmallText(text: forgotPasswordText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400))),
                SizedBox(height: Dimension.height32,),
                AppButton(
                  onTap: (){
                    if(loginFormKey.currentState!.validate()){
                      getLoginResponse(loginController.editEmailController.text.trim(),loginController.editPasswordController.text.trim());
                     // Get.to( ()=>const BottomNavBarPage());
                    }
                  },
                  btnText: login,
                  height: Dimension.height48,
                  btnBackgroundColor: AppColors.lightBlueColor,),
                SizedBox(height: Dimension.height32,),
                 Align(
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: (){
                          Get.to(const SingUpScreen());
                        },
                        child: const RichTextWidget(firstText: doNotHaveAccountText,secondText: registerHereText)))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomTextBar(),
    );
  }

  Widget buildUserNamePasswordUI(){
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(text: "Useremail", textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
          SizedBox(height: Dimension.height08,),
          TextFormField(
            style: GoogleFonts.inter(
              fontSize: Dimension.fontSize16,
              color: AppColors.lightGreyColor,
              fontWeight: FontWeight.w400,
            ),
            controller: loginController.editEmailController,
            obscureText: false,
            keyboardType: TextInputType.name,
            decoration: Common().getInputDecoration(hintText: "enter email"),
            validator: (value){
              return loginController.validateLoginEmail(value.toString());
            },

          ),
          SizedBox(height: Dimension.height32,),
          SmallText(text: passwordText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
          SizedBox(height: Dimension.height08,),
          TextFormField(
            style: GoogleFonts.inter(
              fontSize: Dimension.fontSize16,
              color: AppColors.lightGreyColor,
              fontWeight: FontWeight.w400,
            ),
            controller: loginController.editPasswordController,
            obscuringCharacter: "*",
            obscureText: loginController.isPassHide.value,
            inputFormatters: [
              LengthLimitingTextInputFormatter(16)
            ],
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                contentPadding:  EdgeInsets.only(left: Dimension.width20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimension.height10),
                  borderSide: const BorderSide(
                    color: AppColors.lightFieldBorderColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimension.height10),
                  borderSide: const BorderSide(
                    color: AppColors.lightActiveFieldBorderColor,
                    width: 1.0,
                  ),
                ),
                fillColor: AppColors.lightOrangeBackColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimension.height10),
                  borderSide: const BorderSide(
                    color: AppColors.lightActiveFieldBorderColor,
                    width: 1.0,
                  ),
                ),
                hintText: passwordText,
                hintStyle: GoogleFonts.inter(
                    fontSize: Dimension.fontSize16,
                    color: AppColors.lightGreyColor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal
                ),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      loginController.isPassHide.value = !loginController.isPassHide.value;
                    });


                  },
                  icon: Image.asset(loginController.isPassHide.value ? AppImages.eyeOpenIcon:AppImages.eyeCloseIcon,width: Dimension.height20,height: Dimension.height20,color: AppColors.lightGreyColor,),
                )
            ),
            validator: (value){
              return loginController.validateLoginPassword(value.toString());
            },


          ),




        ],
      ),
    );
  }


  Future<void> getLoginResponse(String email, String password)async{

    Common.showLoading(message: loadingText);
    _map={
      emailApiConsText:email,passwordApiConsText:password,patientTypeApiConsText:"Patient",appIdApiConsText:1
    };
    try{
      var url = Uri.parse(ApiContent.baseUrl+ApiContent.commonApiTag+ApiContent.loginApi);

      var mapHeaders = {
        'Content-Type':'application/json',
        'accept':'application/json'
      };

      var response = await http.post(url,body: jsonEncode(_map),headers: mapHeaders);

      if(response.statusCode==200){
        final mapJsonConverter = json.decode(response.body);
        Common.hideLoading();
        var message = (mapJsonConverter['message']==null)?"":mapJsonConverter['message'];
        String status = (mapJsonConverter['status']==null)?"":mapJsonConverter['status'];
        String error = (mapJsonConverter['error']==null)?"":mapJsonConverter['error'];

        if(status.toString()=="successful"){
          Common.hideLoading();
          var result = (mapJsonConverter["data"]==null)?null:mapJsonConverter["data"];
          UserSharedPreference.setUserIsLogged(true);
          LoginData data = LoginData(id:result["id"],firstName: result["first_name"],lastName: result["last_name"],
              email: result["email"],phoneNumber: result["phone_number"],gender: result["gender"],dateOfBirth: result["date_of_birth"],
              address: result["address"],city: result["city"],state: result["state"],pinCode: result["pin_code"],
              country: result["country"],patientType: result["patient_type"],appId: result["app_id"]);


          UserSharedPreference.setUserFirstName(data.firstName.toString());
          UserSharedPreference.setUserLastName(data.lastName.toString());
          UserSharedPreference.setUserEmail(data.email.toString());
          UserSharedPreference.setUserMobileNum(data.phoneNumber!);
          UserSharedPreference.setUserGender(data.gender.toString());
          UserSharedPreference.setUserDOB(data.dateOfBirth.toString());
          UserSharedPreference.setUserAddress(data.address.toString());
          UserSharedPreference.setUserCity(data.city.toString());
          UserSharedPreference.setUserState(data.state.toString());
          UserSharedPreference.setUserCountry(data.country.toString());
          UserSharedPreference.setUserPinCode(data.pinCode!);
          UserSharedPreference.setUserId(data.id!);
           Get.to(()=>const BottomNavBarPage());
        loginController.editPasswordController.text="";
        loginController.editEmailController.text="";

        }else{
          Common.hideLoading();
          Get.dialog(ServerErrorDialog(errorText:error.toString()));
        }





      }else{
        Common.hideLoading();

      }

    }on PlatformException catch(e){
      Common.hideLoading();
      Get.dialog(ServerErrorDialog(errorText:e.toString()));
    }



  }

}