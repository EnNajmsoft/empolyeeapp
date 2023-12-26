import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/vacationtype.dart';
import 'package:empolyeeapp/data/model/vacationtype.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class EditVacationTypecontroller extends GetxController {
  editVacationtType();
  initialData();
}

class EditVacationTypecontrollerImp extends EditVacationTypecontroller {
  HrVacationtType vacationtData = HrVacationtType(Get.find());

  GlobalKey<FormState> formstateaddvact = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  VacationTypeModel? vacaTypMolde;
  late TextEditingController vacationname;
  late TextEditingController vacationnote;
  String? vacationId;

  @override
  editVacationtType() async {
    if (formstateaddvact.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await vacationtData.editvacationtTypedata(
        vacationId!,
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
  initialData() {
    vacaTypMolde = Get.arguments['vacaTypMolde'];
    vacationId = vacaTypMolde!.vacationTypeId;
    vacationname = TextEditingController();
    vacationnote = TextEditingController();
    vacationname.text = vacaTypMolde!.vacationTypeName!;
    vacationnote.text = vacaTypMolde!.vacationTypeNote!;
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }
}
