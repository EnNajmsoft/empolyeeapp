import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class Addcontroller extends GetxController {
  addvacationt();

  onInit();
}

class AddcontrollerImp extends Addcontroller {
  AdminvacationtData vacationtData = AdminvacationtData(Get.find());

  GlobalKey<FormState> formstateaddvact = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController vacationname;
  late TextEditingController vacationnote;

  @override
  addvacationt() async {
    if (formstateaddvact.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await vacationtData.addvacationtdata(
        vacationname.text,
        vacationnote.text,
      );
      statusRequest = StatusRequest.success;
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.vacationtpyeview);
      } else {}
    }
    update();
  }


@override
void onInit() {
  vacationname = TextEditingController();
  vacationnote = TextEditingController();
  super.onInit();
}
}