
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';

class CustomBackButton extends StatelessWidget{
  final Color? iconColor;
  const CustomBackButton({Key? key, this.iconColor=AppColors.lightBlueColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.only(left: Dimension.width20,top: Dimension.height10,bottom: 5.0),
    child: InkWell(
      onTap: (){
        Get.back();

      },
      borderRadius: BorderRadius.circular(Dimension.height40),
      child: Ink(
        width: Dimension.height40,
        height: Dimension.height40,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.2),
              blurRadius: 7.0,
              offset: const Offset(0.0, 4.0),
            ),
          ],

        ),
        child:  Center(
          child:Image.asset(AppImages.arrowBackIcon,color: iconColor,width: Dimension.fontSize16,height: Dimension.fontSize16,)
          //Icon(Icons.arrow_back_ios_outlined, color: AppColors.lightBlueColor, size: Dimension.height20) ,
        ),

      ),
    ),
    );
  }
  
}