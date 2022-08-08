

import 'package:flutter/material.dart';
import 'package:medsure_patient/res/app_color.dart';

class ComplianceReportModel{

  String title;
  String subTitle;
  String time;
  Color bgColor;

  ComplianceReportModel({required this.time,required this.title,required this.subTitle,required this.bgColor});


  static List<ComplianceReportModel> getComplianceReportData(){

    List<ComplianceReportModel> fetchComplianceReport =[];

    fetchComplianceReport.add(ComplianceReportModel(bgColor: AppColors.miniLightBlueColors, title: 'Consumed', time: '8:00 AM',  subTitle: 'Before Food'));
    fetchComplianceReport.add(ComplianceReportModel(bgColor: AppColors.miniLightBlueColors, title: 'Consumed', time: '1:00 PM',  subTitle: 'Take with Food'));
    fetchComplianceReport.add(ComplianceReportModel(bgColor:  AppColors.miniLightBlueColorss, title: 'Missed', time: '8:00 PM',  subTitle: 'Before Food'));

    return fetchComplianceReport;

  }
}