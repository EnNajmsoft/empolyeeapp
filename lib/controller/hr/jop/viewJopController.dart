import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/JopData.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/data/model/JopModel.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class ViewJopController extends GetxController {
  viewJoop();

}

class ViewJopControllerImp extends ViewJopController {
  JopData jopdata = JopData(Get.find());
  List<JopModel> jops = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  viewJoop() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await jopdata.getAllJopData();
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
      jops.clear();
      jops
          .addAll(responsedata.map((e) => JopModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  // gotoEmployeeDepart(DepartementModel departement) {
  //   Get.toNamed(AppRoutes.employeedepview,
  //       arguments: {"departement": departement});
  // }

  @override
  void onInit() {
    viewJoop();
    super.onInit();
  }
}
