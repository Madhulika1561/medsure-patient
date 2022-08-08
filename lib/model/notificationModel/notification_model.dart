

import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';

class NotificationModel{

  String title;
  String subTitle;
  String time;
  Color bgColor;
  Color iconColor;

  NotificationModel({required this.time,required this.title,required this.subTitle,required this.bgColor,required this.iconColor});


  static List<NotificationModel> getNotificationData(){

    List<NotificationModel> fetchComplianceReport =[];

    fetchComplianceReport.add(NotificationModel(bgColor: AppColors.lightBlueColor,iconColor: AppColors.lightBlueColor, title: 'Patient Representative', time: 'Just now',  subTitle: 'patient Rep. account connected.'));
    fetchComplianceReport.add(NotificationModel(bgColor: AppColors.lightBlueColor, iconColor: AppColors.lightBlueColor,title: 'Patient Representative', time: '10 min',  subTitle: 'patient Rep. account connected.'));
    fetchComplianceReport.add(NotificationModel(bgColor:  AppColors.hintTextColor,iconColor: AppColors.hintTextColor, title: 'Patient Representative', time: 'Yesterday',  subTitle: 'patient Rep. account connected.'));
    fetchComplianceReport.add(NotificationModel(bgColor:  AppColors.hintTextColor,iconColor: AppColors.hintTextColor, title: 'Patient Representative', time: 'Last month',  subTitle: 'patient Rep. account connected.'));

    return fetchComplianceReport;

  }
}