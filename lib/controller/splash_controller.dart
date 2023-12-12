

import 'package:get/get.dart';

import '../../../routes/app_routes.dart';


class SplashController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(
        AppRoutes.welcomeScreen,
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
