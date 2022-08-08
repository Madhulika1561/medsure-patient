

import 'package:flutter/widgets.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class PersonalInfoRowText extends StatelessWidget{
  final String firstName;
  final String lastName;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight,fontWeight1;

  const PersonalInfoRowText({Key? key, required this.firstName, required this.lastName, this.textColor, this.textSize, this.fontWeight, this.fontWeight1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallText(text: firstName, textColor: textColor!, textSize: textSize!, fontWeight: fontWeight!),
        SmallText(text: lastName, textColor: textColor!, textSize: textSize!, fontWeight: fontWeight1!),
      ],
    );
  }




}