import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(
        AppRoutes.languageScreen,
      );
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
