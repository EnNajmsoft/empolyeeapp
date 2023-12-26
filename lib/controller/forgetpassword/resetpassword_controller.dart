import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/data/datasource/remote/auth/forgetpassword/resetpassword.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:empolyeeapp/screen/reset_password_successful_dialog/reset_password_successful_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstatenowpass = GlobalKey<FormState>();

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "1".tr, middleText: "6".tr);
    }

    if (formstatenowpass.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postdata(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          AlertDialog(
            content: ResetPasswordSuccessfulDialog(),
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.only(left: 0),
          );

          Get.offAllNamed(AppRoutes.signInScreen);
        } else {
          Get.defaultDialog(title: "1".tr, middleText: "7".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    print('============email 3 $email=========================');

    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
