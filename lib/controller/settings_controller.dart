
import 'package:empolyeeapp/core/app_export.dart';
import 'package:empolyeeapp/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    // String userid = myServices.sharedPreferences.getString("id")!;
    // .unsubscribeFromTopic("users");
    // FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.signInScreen);
  }
}
