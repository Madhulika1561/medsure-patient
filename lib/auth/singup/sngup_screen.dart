

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:medsure_patient/auth/login/login_screen.dart';
import 'package:medsure_patient/auth/singup/singupController/singup_controller.dart';
import 'package:medsure_patient/helper/common.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/app_button.dart';
import 'package:medsure_patient/widgetHelper/big_text.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class SingUpScreen extends StatefulWidget{
   const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  SingUpController singUpController = Get.put(SingUpController());
  late Map _map;

  String radioType = "Male";

  int id = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        width: Dimension.screenWidth,
        height: Dimension.screenHeight,
        child: Form(
          key: singUpController.signupFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: Dimension.width20,right: Dimension.width20,top: Dimension.height54),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: signUpText, textColor: AppColors.lightBlueColor, textSize: Dimension.fontSize25, fontWeight: FontWeight.w700),
                      GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Icon(Icons.close,size: Dimension.height20,color: AppColors.blackColor,))
                    ],
                  ),
                  SizedBox(height: Dimension.height20,),
                  buildFirstNameUI(),
                  SizedBox(height: Dimension.height32,),
                  buildLastNameUI(),
                  SizedBox(height: Dimension.height32,),
                  buildEmailUI(),
                  SizedBox(height: Dimension.height32,),
                  buildMobileNumUI(),
                  SizedBox(height: Dimension.height32,),
                  buildPasswordUI(),
                  SizedBox(height: Dimension.height32,),
                  buildGenderUI(),
                  SizedBox(height: Dimension.height32,),
                  buildDateOfBirthUI(),
                  SizedBox(height: Dimension.height32,),
                  buildAddressUI(),
                  SizedBox(height: Dimension.height32,),
                  buildCityUI(),
                  SizedBox(height: Dimension.height32,),
                  buildStateUI(),
                  SizedBox(height: Dimension.height32,),
                  buildPostalCodeUI(),
                  SizedBox(height: Dimension.height32,),
                  buildCountryUI()

                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: Dimension.screenWidth,
        height: Dimension.height65,
        color: AppColors.whiteOneColor,
        child: Padding(
          padding: EdgeInsets.only(left: Dimension.width30,right: Dimension.width30,top: Dimension.height10,bottom: Dimension.height10),
          child: AppButton(
            onTap: (){
              //singUpController.isLoading.value?null:singUpController.loading();
              /* if(singUpController.signupFormKey.currentState!.validate()){
                  Get.to(()=>const LogInScreen());
                }*/
              Common.showLoading(message: "Loading..");
            },
            btnText: signUpText.toString(),
            height: Dimension.height48,
            //iconData: singUpController.isLoading.value?CircularProgressIndicator():Icons.add,
            btnTextColor: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: firstNameText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editFirstName,
          obscureText: false,
          keyboardType: TextInputType.name,
          decoration: Common().getInputDecoration(hintText: enterFirstNameText),
          validator: (value){
            return singUpController.validateName(value.toString());
          },

        ),
      ),
    ],
  );

  Widget buildLastNameUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: lastNameText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editLastName,
          obscureText: false,
          keyboardType: TextInputType.name,
          decoration: Common().getInputDecoration(hintText: enterLastNameText),
          validator: (value){
            return singUpController.validateLastName(value.toString());
          },

        ),
      ),
    ],
  );

  Widget buildEmailUI()=>Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SmallText(text: emailIdText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
       SizedBox(height: Dimension.height08,),
       SizedBox(
         height: Dimension.height48,
         child: TextFormField(
           style: GoogleFonts.inter(
             fontSize: Dimension.fontSize16,
             color: AppColors.lightGreyColor,
             fontWeight: FontWeight.w400,
           ),
           controller: singUpController.editEmail,
           obscureText: false,
           keyboardType: TextInputType.emailAddress,
           decoration: Common().getInputDecoration(hintText: enterEmailIdText),
           validator: (value){
             return singUpController.validateSingUpEmail(value.toString());
           },

         ),
       ),
     ],
   );

  Widget buildMobileNumUI()=>Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SmallText(text: mobileNumText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
       SizedBox(height: Dimension.height08,),
       SizedBox(
         height: Dimension.height48,
         child: TextFormField(
           style: GoogleFonts.inter(
             fontSize: Dimension.fontSize16,
             color: AppColors.lightGreyColor,
             fontWeight: FontWeight.w400,
           ),
           controller: singUpController.editMobileNum,
           obscureText: false,
           keyboardType: TextInputType.number,
           inputFormatters: [
             LengthLimitingTextInputFormatter(14)
           ],
           decoration: Common().getInputDecoration(hintText: enterMobileNumText),
           validator: (value){
             return singUpController.validateSingUpMobile(value.toString());
           },

         ),
       ),
     ],
   );

  Widget buildPasswordUI()=>Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SmallText(text: passwordText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
       SizedBox(height: Dimension.height08,),
       SizedBox(
         height: Dimension.height48,
         child: TextFormField(
           style: GoogleFonts.inter(
             fontSize: Dimension.fontSize16,
             color: AppColors.lightGreyColor,
             fontWeight: FontWeight.w400,
           ),
           controller: singUpController.editPassword,
           obscuringCharacter: "*",
           obscureText: singUpController.isPassHide.value,
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
               hintText: "Enter password",
               hintStyle: GoogleFonts.inter(
                   fontSize: Dimension.fontSize16,
                   color: AppColors.lightGreyColor,
                   fontWeight: FontWeight.w400,
                   fontStyle: FontStyle.normal
               ),
               suffixIcon: IconButton(
                 onPressed: (){

                   singUpController.isPassHide.value = !singUpController.isPassHide.value;



                 },
                 icon: Image.asset(singUpController.isPassHide.value ? AppImages.eyeOpenIcon:AppImages.eyeCloseIcon,width: Dimension.height20,height: Dimension.height20,color: AppColors.lightGreyColor,),
               )
           ),
           validator: (value){
           return singUpController.validateSingUpPassword(value.toString());
           },


         ),
       ),
     ],
   );

  Widget buildGenderUI()=>Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       SmallText(text: genderText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
       SizedBox(height: Dimension.height08),
       Row(
         children: [

           Radio(
             value: 1,
             groupValue: id,
             onChanged: (val) {
               setState(() {
                 radioType = 'Male';
                 id = 1;
               });
             },
           ),
           Text(
             'Male',
             style: GoogleFonts.comfortaa(
               color: context.theme.primaryColorDark,
               fontSize: 16.0,
               fontWeight: FontWeight.w400,
             ),
           ),
           SizedBox(width: Dimension.width20,),
           Radio(
             value: 2,
             groupValue: id,
             onChanged: (val) {
               setState(() {
                 radioType = 'Female';
                 id = 2;
                 //print(radioButtonItem.toString());
               });
             },
           ),
           Text(
             'Female',
             style: GoogleFonts.comfortaa(
               color: context.theme.primaryColorDark,
               fontSize: 16.0,
               fontWeight: FontWeight.w400,
             ),
           ),
         ],
       )
     ],
   );

  Widget buildAddressUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: addressText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editAddress,
          obscureText: false,
          keyboardType: TextInputType.text,
          decoration: Common().getInputDecoration(hintText: enterFullAddressText),
          validator: (value){
            return singUpController.validateSingUpAddress(value.toString());
          },

        ),
      ),
    ],
  );

  Widget buildDateOfBirthUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: dobText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editDateInput,
          obscureText: false,
          keyboardType: TextInputType.text,
          enableInteractiveSelection: false,
          readOnly: true,
          decoration:  InputDecoration(
            contentPadding: const EdgeInsets.only(left: 16.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.lightFieldBorderColor,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.lightActiveFieldBorderColor,
                width: 1.0,
              ),
            ),
            fillColor: AppColors.lightOrangeBackColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.lightActiveFieldBorderColor,
                width: 1.0,
              ),
            ),
            hintText: enterDOBText,
            suffixIcon: const Icon(Icons.calendar_month,color: AppColors.lightBlueColor,),
            hintStyle: GoogleFonts.inter(
              fontSize: 16.0,
              color: AppColors.lightGreyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          validator: (value){
            return singUpController.validateSingUpDOB(value.toString());
          },
          onTap: (){
            selectedDate();
          },

        ),
      ),
    ],
  );

  Widget buildCityUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: cityText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editCity,
          obscureText: false,
          keyboardType: TextInputType.text,
          decoration: Common().getInputDecoration(hintText: enterCityText),
          validator: (value){
            return singUpController.validateSingUpCity(value.toString());
          },

        ),
      ),
    ],
  );

  Widget buildStateUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: stateText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editState,
          obscureText: false,
          keyboardType: TextInputType.text,
          decoration: Common().getInputDecoration(hintText: enterStateText),
          validator: (value){
            return singUpController.validateSingUpState(value.toString());
          },

        ),
      ),
    ],
  );

  Widget buildPostalCodeUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: postalCodeText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editPassCode,
          obscureText: false,
          keyboardType: TextInputType.text,
          decoration: Common().getInputDecoration(hintText: enterPostalCodeText),
          validator: (value){
            return singUpController.validateSingUpPostalCode(value.toString());
          },

        ),
      ),
    ],
  );

  Widget buildCountryUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SmallText(text: countryText, textColor: AppColors.lightLBGreyOneColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400),
      SizedBox(height: Dimension.height08,),
      SizedBox(
        height: Dimension.height48,
        child: TextFormField(
          style: GoogleFonts.inter(
            fontSize: Dimension.fontSize16,
            color: AppColors.lightGreyColor,
            fontWeight: FontWeight.w400,
          ),
          controller: singUpController.editCountry,
          obscureText: false,
          keyboardType: TextInputType.text,
          decoration: Common().getInputDecoration(hintText: enterCountryText),
          validator: (value){
            return singUpController.validateSingUpCountry(value.toString());
          },

        ),
      ),
    ],
  );


  void selectedDate() async{
    DateTime? pickedDate = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2010), lastDate: DateTime(2030));

    if(pickedDate!=null){
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        singUpController.editDateInput.text = formattedDate;
      });
    }else{

    }
  }
}