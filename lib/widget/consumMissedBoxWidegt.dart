
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';

class ConsumedMissedBoxWidget extends StatelessWidget {
  const ConsumedMissedBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        /// consumed box
        Container(
          height: Dimension.height16,
          width: Dimension.height16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: AppColors.lightBlueColor,
          ),
        ),
         SizedBox(width: Dimension.height08),
        Text('Consumed',
          style: GoogleFonts.comfortaa(
            fontSize: Dimension.fontSize14,
            fontWeight: FontWeight.w400,
            color: AppColors.hintTextColor,
          ),
        ),

        /// space between
         SizedBox(width: Dimension.width24),

        /// missed box
        Container(
          height: Dimension.height16,
          width: Dimension.height16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: AppColors.lightLBRedColor,
          ),
        ),
         SizedBox(width: Dimension.height08),
        Text('Missed',
          style: GoogleFonts.comfortaa(
            fontSize: Dimension.fontSize14,
            fontWeight: FontWeight.w400,
            color: AppColors.hintTextColor,
          ),
        ),
      ],
    );
  }
}
