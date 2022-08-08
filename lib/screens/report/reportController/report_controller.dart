

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/model/reportModel/compliance_report_model.dart';

class ReportController extends GetxController{

  Map<String,double> dataMap ={"Consumed": 2, "Missed": 1,};

  List<ComplianceReportModel> complianceList = ComplianceReportModel.getComplianceReportData();

  RxBool week = true.obs;
  RxBool month = false.obs;
  RxBool year = false.obs;


  void weekActive(){
    week.value = true;
    month.value = false;
    year.value = false;
  }

  void monthsActive(){
    week.value = false;
    month.value = true;
    year.value = false;
  }

  void yearActive(){
    week.value = false;
    month.value = false;
    year.value = true;
  }

  RxBool isNext = false.obs;
  RxBool isPrev = true.obs;


  void isNextFun(){
    isNext.value = true;
    isPrev.value = false;
  }
  void isPrevFun(){
    isNext.value = false;
    isPrev.value = true;
  }

  var selectedDate = DateTime.now().obs;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024));
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

}