

import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class AppButton extends StatelessWidget{
  final String? btnText;
  final Color?  btnTextColor;
  final Color?  btnBackgroundColor;
  final double? width;
  final double? height;
  final double? radius;
  final Color? borderColor;
  final Function()? onTap;

    AppButton({Key? key,
     this.btnText="Button Text",
     this.btnTextColor=AppColors.whiteColor,
     this.btnBackgroundColor=AppColors.lightBlueColor,
     this.width,
     this.height=48.0, this.radius, required this.onTap, this.borderColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? MediaQuery.of(context).size.width, height!),
        primary: btnBackgroundColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 40.0),
        ),
        elevation: 1.5,
        shadowColor: AppColors.shadowColor.withOpacity(0.2),
        side: BorderSide(
          color: borderColor ?? AppColors.lightBlueColor,
          width: 1.0,
        ),

      ),

        onPressed: onTap, child: SmallText(text: btnText!, textColor: btnTextColor!, textSize: Dimension.fontSize16, fontWeight: FontWeight.w400));
  }

}