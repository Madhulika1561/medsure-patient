

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:medsure_patient/res/app_color.dart';
import 'package:medsure_patient/res/dimension.dart';
import 'package:medsure_patient/widgetHelper/small_text.dart';

class BounceWidget extends StatelessWidget{
  final String? text;
  final Color? textColor;
  final Color? color;
  final Function()? tap;
  final double? topLeftRadiusSize;
  final double? topRightRadiusSize;
  final double? bottomLeftRadiusSize;
  final double? bottomRightRadiusSize;
  const BounceWidget({Key? key, this.text, this.color, this.tap, this.textColor,this.topLeftRadiusSize=0.0, this.topRightRadiusSize=0.0, this.bottomLeftRadiusSize=0.0, this.bottomRightRadiusSize=0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Bounceable(
      onTap: tap,
      child: Container(
        height: Dimension.height50,
        decoration: BoxDecoration(
          color: color,
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(topLeftRadiusSize!),
            bottomLeft: Radius.circular(bottomLeftRadiusSize!),
            topRight: Radius.circular(topRightRadiusSize!),
            bottomRight: Radius.circular(bottomRightRadiusSize!),
          )
        ),
        child: Center(
          child: SmallText(text: text!, textColor: textColor!, textSize: Dimension.fontSize16, fontWeight: FontWeight.w700),
        ),
      ),

    );
  }

}