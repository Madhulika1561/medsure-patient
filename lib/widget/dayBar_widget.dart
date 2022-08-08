
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';


class DayBarWidget extends StatelessWidget {
  final String? dateText;
  final String? consumeMeasureText;
  final String? missedMeasureText;
  final int? consumeFirstFlex;
  final int? consumeSecondFlex;
  final int? missedFirstFlex;
  final int? missedSecondFlex;
  final bool? isConsumeZero;
  final bool? isMissedZero;
  final Function()? onDateTap;

  const DayBarWidget({Key? key,
    this.dateText = '22 Oct',
    this.consumeMeasureText = '04',
    this.missedMeasureText = '01',
    this.consumeFirstFlex = 0,
    this.consumeSecondFlex = 4,
    this.missedFirstFlex = 1,
    this.missedSecondFlex = 3,
    this.isConsumeZero = false,
    this.isMissedZero = false,
    required this.onDateTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onDateTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0, left: 2.0, right: 2.0),
            child: Text(
              dateText!,
              style: GoogleFonts.comfortaa(
                fontSize: Dimension.fontSize16,
                fontWeight: FontWeight.w700,
                color: AppColors.lightBlueColor,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ),
        SizedBox(width: Dimension.width30),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: consumeFirstFlex!,
                      child: Container(
                        height: Dimension.height20,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.0),
                            bottomLeft: Radius.circular(2.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: consumeSecondFlex!,
                      child: Container(
                        height: Dimension.height20,
                        decoration: BoxDecoration(
                          color: isConsumeZero == true ? Colors.transparent : AppColors.lightBlueColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2.0),
                            bottomLeft: Radius.circular(2.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(consumeMeasureText!,
                              style: GoogleFonts.comfortaa().copyWith(
                                fontSize: Dimension.fontSize12,
                                fontWeight: FontWeight.w700,
                                color: isConsumeZero == true ? AppColors.lightBlueColor : AppColors.whiteColor,
                              ),
                            ),
                             SizedBox(width: Dimension.height08),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.055,
                width: 1.0,
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: missedFirstFlex!,
                      child: Container(
                        height: Dimension.height20,
                        decoration: BoxDecoration(
                          color: isMissedZero == true ? Colors.transparent : AppColors.redBorderColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(2.0),
                            bottomRight: Radius.circular(2.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 8.0),
                            Text(missedMeasureText!,
                              style: GoogleFonts.comfortaa(
                                fontSize: Dimension.fontSize12,
                                fontWeight: FontWeight.w700,
                                color: isMissedZero == true ? AppColors.redBorderColor : AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: missedSecondFlex!,
                      child: Container(
                        height: 20.0,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(2.0),
                            bottomRight: Radius.circular(2.0),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
