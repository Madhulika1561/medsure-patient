

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medsure_patient/screens/medicine/medicine_details.dart';


class MedicineController extends GetxController{

   Map<String, double> dataMap ={
     "Consumed":50,
     "Missed":25,
     "Remaining":25
   };
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

  showDetailsPage()async {
    Future.delayed(const Duration(milliseconds: 2),(){
      Get.to(MedicineDetailsScreen());
    });
  }
}