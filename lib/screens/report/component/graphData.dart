
import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/res/string.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class GraphData extends StatelessWidget{
  final Color? boxColor;
  final String? text;
  final String? value;
  const GraphData({Key? key, this.boxColor, this.text=consumedText, this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Container(
          width: Dimension.height16,
          height: Dimension.height16,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(4.0)
          ),
        ),
        SizedBox(width: Dimension.width10,),
        Expanded(child: SmallText(text: text!, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize14, fontWeight: FontWeight.w400)),
        SmallText(text: value!, textColor: AppColors.hintTextColor, textSize: Dimension.fontSize16, fontWeight: FontWeight.w400)


      ],
    );
  }

}