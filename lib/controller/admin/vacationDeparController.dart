

import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class AdminVacationController extends GetxController {
  getEmpVacDep();
  filterData(String valu);
  approvalvac(empVacationId);
  rejectvac(empVacationId);
  getempvacationtOne(empId);
  onInit();
}

class AdminVacationControllerImp extends AdminVacationController {
  AdminvacationtData empvacatData = AdminvacationtData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
String departid = "1";
  List<EmpVacationModel> empVacations = [];
  List<EmpVacationModel> empvactall = [];
  List<EmpVacationModel> empvacwait = [];
  List<EmpVacationModel> empvactaprov = [];
  List<EmpVacationModel> empvactanjc = [];
  List<EmpVacationModel> empvactone = [];


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
  approvalvac(empVacationId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await empvacatData.aprroAdminvacation(empVacationId);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      // empvactaprov.removeWhere((element) => element.empVacationId = empVacationId);
      print('chang ssssssssss');
      filterData("2");
    } else {}

    update();
  }

  @override
  rejectvac(empVacationId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await empvacatData.rejectAdminvacation(empVacationId);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      filterData("1");
      // empvactaprov.removeWhere((element) => element.empVacationId = empVacationId);
      update();
      print('chang ssssssssss');
    } else {}

    update();
  }

  gotoVacation(EmpVacationModel vacation) {
    Get.toNamed(AppRoutes.onevacation, arguments: {"vacationmodel": vacation});
  }

  @override
  getempvacationtOne(empId) async {
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
    getEmpVacDep();

    super.onInit();
  }
}


// import 'package:empolyeeapp/core/class/statusrequest.dart';
// import 'package:empolyeeapp/data/datasource/remote/hr/DepartementData.dart';
// import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
// import 'package:empolyeeapp/data/model/DepartementModel.dart';
// import 'package:empolyeeapp/data/model/usermodel.dart';
// import 'package:get/get.dart';

// abstract class AdminVacationController extends GetxController {
//   viewAllUser();
//   viewUserDepart();
//   initialData();
// }

// class AdminVacationControllerImp extends AdminVacationController {
//   UserData userData = UserData(Get.find());
//   List<UserModel> allusers = [];
//   List<UserModel> depusers = [];
//   DepartementModel? departement;
//   String? departid;
//   StatusRequest statusRequest = StatusRequest.none;

//   @override
//   viewAllUser() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await userData.getAllUserData();
//     statusRequest = StatusRequest.success;
//     if (response['status'] == "success") {
//       print('======================$response================');
//       List responsedata = response['data'];
//       allusers.clear();
//       allusers.addAll(responsedata.map((e) => UserModel.fromJson(e)));
//     } else {
//       statusRequest = StatusRequest.failure;
//     }

//     update();
//   }

//   @override
//   viewUserDepart() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await userData.getDeparUserData(departid);
//     statusRequest = StatusRequest.success;
//     if (response['status'] == "success") {
//       print('======================$response================');
//       List responsedata = response['data'];
//       depusers.clear();
//       depusers.addAll(responsedata.map((e) => UserModel.fromJson(e)));
//     } else {
//       print('=====================errrrrrrrrr================');

//       statusRequest = StatusRequest.failure;
//     }

//     update();
//   }

//   @override
//   @override
//   initialData() {
//     departement = Get.arguments['departement'];
//     departid = departement!.departId!;
//   }

//   @override
//   void onInit() {
//     initialData();
//     viewAllUser();
//     viewUserDepart();
//     super.onInit();
//   }
// }
