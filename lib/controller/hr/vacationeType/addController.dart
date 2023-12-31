import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/vacationtype.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class AddVacationTypecontroller extends GetxController {
  addVacationtType();

  onInit();
}

class AddVacationTypecontrollerImp extends AddVacationTypecontroller {
  HrVacationtType vacationtData = HrVacationtType(Get.find());

  GlobalKey<FormState> formstateaddvact = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController vacationname;
  late TextEditingController vacationnote;

  @override
  addVacationtType() async {
    if (formstateaddvact.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await vacationtData.addvacationtTypedata(
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