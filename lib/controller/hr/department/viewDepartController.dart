import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/DepartementData.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class VeiwDepartcontroller extends GetxController {
  viewDepartement();

  onInit();
}

class VeiwDepartcontrollerImp extends VeiwDepartcontroller {
  DepartementData departementdata = DepartementData(Get.find());
  List<DepartementModel> departements = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  viewDepartement() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await departementdata.getDepartementData();
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
      departements.clear();
      departements
          .addAll(responsedata.map((e) => DepartementModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
  goToEditDepart(DepartementModel departModel) {
    Get.toNamed(AppRoutes.editedepartscreen,
        arguments: {"departModel": departModel});
  }
  
  gotoEmployeeDepart( departementid) {
    Get.toNamed(AppRoutes.employeedepview,
        arguments: {"departement": departementid});
  }

  void onInit() {
    viewDepartement();
    super.onInit();
  }
}
