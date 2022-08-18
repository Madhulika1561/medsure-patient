
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/bottom_screen/needHelp/need_help.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/app_images.dart';
import 'package:medsure_patient/res/dimension.dart';

class CustomBottomTextBar  extends StatelessWidget{
  const CustomBottomTextBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      //color: AppColors.whiteOneColor,
      height: Dimension.height32,
      width: width,
      margin:  EdgeInsets.only(left: Dimension.width20, right: Dimension.width20, bottom: Dimension.height20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100.0,
            child: SvgPicture.asset(AppImages.appLogoIcon),
          ),
          Material(
            //color: AppColors.whiteOneColor,
            child: InkWell(
              onTap: (){
                Get.to(const NeedHelpScreen());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppImages.needHelpIcon),
                  const SizedBox(width: 6.0),
                  Text('Need Help?',
                    style: GoogleFonts.comfortaa(
                      color: AppColors.lightActiveFieldBorderColor,
                      fontSize: Dimension.fontSize14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}