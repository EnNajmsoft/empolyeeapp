import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/core/services/services.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AdminVacationController extends GetxController {
  getEmpVacDep();
  filterData(String valu);
  approvalVac(empVacationId);
  rejectVac(empVacationId);
  getEmpVactOne(empId);
  onInit();
}

class AdminVacationControllerImp extends AdminVacationController {

  MyServices myServices = Get.find();
  AdminvacationtData empvacatData = AdminvacationtData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
 

  String? departid;
  List<EmpVacationModel> empVacations = [];
  List<EmpVacationModel> empvactall = [];
  List<EmpVacationModel> empvacwait = [];
  List<EmpVacationModel> empvactaprov = [];
  List<EmpVacationModel> empvactanjc = [];
  List<EmpVacationModel> empvactone = [];


  @override
  getEmpVacDep() async {
    statusRequest = StatusRequest.loading;
    var response = await empvacatData.getEmpVacDeparData(departid);
    print("=============================== va============= $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        empvactall = response['data']
            .map<EmpVacationModel>((e) => EmpVacationModel.fromJson(e))
            .toList();
        empVacations = empvactall; // Initial assignment
        empvacwait = empvactall
            .where((element) => element.vacationStateAdmin == "0")
            .toList();
        empvactaprov = empvactall
            .where((element) => element.vacationStateAdmin == "1")
            .toList();
        empvactanjc = empvactall
            .where((element) => element.vacationStateAdmin == "2")
            .toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  filterData(String valu) {
    if (valu == '1') {
      empVacations = empvactaprov;
      print(
          "=============================== flter aprooov============= $empvactaprov  ");
    } else if (valu == '2') {
      empVacations = empvactanjc;
      print(
          "=============================== flter enjeeecc============= $empvactanjc  ");
    } else if (valu == '0') {
      empVacations = empvacwait;
      print(
          "=============================== flter wit============= $empvacwait ");
    } else {
      empVacations = empvactall;
      print(
          "=============================== flter dufolt all============= $empvactall ");
    }

    update();
  }

  @override
  approvalVac(empVacationId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await empvacatData.aprroAdminvacation(empVacationId);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      empvactanjc
          .removeWhere((element) => element.empVacationId == empVacationId);
      print('chang  ssssssssss approvalvac');
      getEmpVacDep();
    } else {}
    update();
  }

  @override
  rejectVac(empVacationId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await empvacatData.rejectAdminvacation(empVacationId);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      empvactaprov
          .removeWhere((element) => element.empVacationId == empVacationId);
      update();
      print('chang ssssssssss rejectvac');
      getEmpVacDep();
    } else {}
    update();
  }

  gotoVacation(EmpVacationModel vacation) {
    Get.toNamed(AppRoutes.onevacation, arguments: {"vacationmodel": vacation});
  }

  @override
  getEmpVactOne(empId) async {
    statusRequest = StatusRequest.loading;
    var response = await empvacatData.getempvacDataOne(empId);
    print("=============================== va   one============= $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        empvactone.clear();
        empvactone
            .addAll(responsedata.map((e) => EmpVacationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    departid = myServices.sharedPreferences.getString("departId");
    print("==============================departId");
    print("==============================$departid");
    getEmpVacDep();
    super.onInit();
  }
}