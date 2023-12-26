import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.emphome);
    } else if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.signInScreen);
    } else if (myServices.sharedPreferences.getString("step") == "3") {
      return const RouteSettings(name: AppRoutes.empvacationdepview);
    } else if (myServices.sharedPreferences.getString("step") == "4") {
      return const RouteSettings(name: AppRoutes.empvacationview);
    }else {
    return null;

    }

   
  }
}
