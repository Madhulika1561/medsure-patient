

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:medsure_patient/model/notificationModel/notification_model.dart';

class NotificationController extends GetxController{

  List<NotificationModel> notificationList = NotificationModel.getNotificationData();

}