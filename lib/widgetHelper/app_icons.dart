

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medsure_patient/res/app_color.dart';

class AppCircleImages extends StatelessWidget{
  final IconData icon;
  final double iconSize;
  final double size;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? shadowColor;

  const AppCircleImages({Key? key, required this.icon, required this.iconSize, required this.size, this.iconColor, this.backgroundColor=AppColors.lightActiveFieldBorderColor, this.shadowColor=AppColors.shadowColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: size,
      height: size,
      decoration:  BoxDecoration(
        color:backgroundColor!,
        shape: BoxShape.circle,
        boxShadow:  [BoxShadow(color: shadowColor!,offset: Offset(0.0,4.0),blurRadius: 7.0)]
      ),
      child: Center(
        child: Icon(icon,size: iconSize,color: iconColor,),
      ),
    );
  }

}