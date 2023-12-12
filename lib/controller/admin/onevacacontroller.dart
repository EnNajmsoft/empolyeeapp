import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:get/get.dart';

abstract class Onevaacontrol extends GetxController {
  initialData();
  approvalvac();
}

class OnevaacontrolImp extends Onevaacontrol {
  EmpVacationModel? onevacation;
  StatusRequest statusRequest = StatusRequest.none;

  AdminvacationtData vacationtData = AdminvacationtData(Get.find());
  @override
  initialData() {
    // print("onecon ${onevacation!.empVacationCreate}");
    onevacation = Get.arguments['vacationmodel'];
    update();
  }

  @override
  approvalvac() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await vacationtData
        .aprrovacation(onevacation!.empVacationId);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('chang ssssssssss');
    } else {

    }

    update();
  }

  @override
  onInit() {
    initialData();
    super.onInit();
  }
}
