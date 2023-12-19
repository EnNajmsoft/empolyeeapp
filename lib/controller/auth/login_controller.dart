import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/core/services/services.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:empolyeeapp/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/datasource/remote/auth/login.dart';
import '../../routes/app_routes.dart';

abstract class LoginController extends GetxController {
  login();
  // loginadmin();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstatelogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['userApproval'] == "0") {
            Get.defaultDialog(
                title: "خطأ التحقق من الايميل",
                middleText: " يرجى التحقق من الايميل");
          } else if (response['data']['userApproval'] == "1") {
            Get.defaultDialog(
                title: " حالة انتظار",
                middleText: "لم يتم الموافقه على المستخدم بعد");
          } else if (response['data']['userApproval'] == "2") {
            Get.defaultDialog(
                title: " حالة رفض", middleText: " تم رفض هذا المستخدم ");
          } else if (response['data']['userApproval'] == "3") {

            myServices.sharedPreferences
                .setString("id", response['data']['userId']);
            String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['userUsername']);
            myServices.sharedPreferences
                .setString("departId", response['data']['departId']);
            myServices.sharedPreferences
                .setString("email", response['data']['userEmail']);
            myServices.sharedPreferences
                .setString("phone", response['data']['userPhone']);
            myServices.sharedPreferences
                .setString("userType", response['data']['userType']);

            if (response['data']['userType'] == "0") {
              myServices.sharedPreferences.setString("step", "2");
              FirebaseMessaging.instance.subscribeToTopic("user");
              Get.offAllNamed(AppRoutes.emphome);
            } else if (response['data']['userType'] == "1") {
              myServices.sharedPreferences.setString("step", "3");
              FirebaseMessaging.instance.subscribeToTopic("admin");
              Get.offAllNamed(AppRoutes.empvacationdepview);
            } else if (response['data']['userType'] == "2") {
              myServices.sharedPreferences.setString("step", "4");
              FirebaseMessaging.instance.subscribeToTopic("HR");
              Get.offAllNamed(AppRoutes.empvacationview);
            } else {}

          }else{
             Get.defaultDialog(title: "1".tr, middleText: "3".tr);
            statusRequest = StatusRequest.failure;
          }


          //     myServices.sharedPreferences
          //         .setString("brithday", response['data']['user_brithday']);
          //     myServices.sharedPreferences
          //         .setString("gander", response['data']['user_gender']);
          //           Firebase.initializeApp();
          // FirebaseMessaging.instance.subscribeToTopic("users");

          // Get.offAllNamed(AppRoutes.emphome);

          // } else {
          //   // Get.toNamed(AppRoutes.verfiyCodeSignUp,
          //   //     arguments: {"email": email.text});
          // }
        } else {
          Get.defaultDialog(title: "1".tr, middleText: "3".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }


  @override
  goToSignUp() {
    Get.toNamed(AppRoutes.fillProfileScreen);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen,
        arguments: {"email": email.text});
  }
}
