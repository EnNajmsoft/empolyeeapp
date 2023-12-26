// import 'package:empolyeeapp/core/class/statusrequest.dart';
// import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
// import 'package:empolyeeapp/core/services/services.dart';
// import 'package:empolyeeapp/data/datasource/remote/empolyee/vacation.dart';
// import 'package:empolyeeapp/data/model/empvacation.dart';
// import 'package:empolyeeapp/routes/app_routes.dart';
// import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';

// abstract class Empusercontroller extends GetxController {
//   getempvacationt();
// }

// class EmpusercontrollerImp extends Empusercontroller {
//   EmpuservacationtData empvacatData = EmpuservacationtData(Get.find());

//   StatusRequest statusRequest = StatusRequest.none;

//   List<EmpVacationModel> empvact = [];

//   MyServices myServices = Get.find();

//   String? username;
//   String? userid;
//   String vacationstate = '0';

//   @override
//   getempvacationt() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     var response = await empvacatData.getempvacData(userid);
//     print(
//         "=============================== vacation user 1 ============= $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         List responsedata = response['data'];

//         if (vacationstate == '0') {
//           empvact.clear();
//           empvact.addAll(responsedata.map((e) => EmpVacationModel.fromJson(e)));
//         } else {
//           empvact.clear();
//           empvact.addAll(responsedata.map((e) => EmpVacationModel.fromJson(e)));
//           empvact.removeWhere((element) => element.vacationStateAdmin != "0");
//         }
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

// changstatvac(){
//   if(vacationstate == '1'){
//   vacationstate = '0';

//   }else{
//       vacationstate = '1';

//   }
//   print('statchangeeeeeeeeeeeeeeee');
//   getempvacationt();
//   update();
// }
//   @override
//   void onInit() {
//     username = myServices.sharedPreferences.getString("username");
//     // userid = myServices.sharedPreferences.getString("id");
// userid = "1";
//     getempvacationt();
//     super.onInit();
//   }
// }

import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/core/services/services.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class Empusercontroller extends GetxController {
  getempvacationt();
  filterData(String valu);
  refrehVacation();

  getempvacationtOne(empId);
}

class EmpusercontrollerImp extends Empusercontroller {
  AdminvacationtData empvacatData = AdminvacationtData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  List<EmpVacationModel> empVacations = [];
  List<EmpVacationModel> empvactall = [];
  List<EmpVacationModel> empvacwait = [];
  List<EmpVacationModel> empvactaprov = [];
  List<EmpVacationModel> empvactanjc = [];
  List<EmpVacationModel> empvactone = [];

  String? username;
  String? userid;
  @override
  getempvacationt() async {
    statusRequest = StatusRequest.loading;
    var response = await empvacatData.getempvacuserData(userid);
    print("=============================== va============= $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        empvactall = response['data']
            .map<EmpVacationModel>((e) => EmpVacationModel.fromJson(e))
            .toList();

        empVacations = empvactall; // Initial assignment

        empvacwait = empvactall
            .where((element) => element.vacationStateHr == "0")
            .toList();
        empvactaprov = empvactall
            .where((element) => element.vacationStateHr == "1")
            .toList();
        empvactanjc = empvactall
            .where((element) => element.vacationStateHr == "2")
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
  refrehVacation() {
    getempvacationt();
  }

  @override
  void onInit() {
    username = myServices.sharedPreferences.getString("username");
    userid = myServices.sharedPreferences.getString("id");
    print("==========================userid============================");
    print(userid);
    print("==========================step============================");

    print(myServices.sharedPreferences.getString("step"));
    print("==========================userType============================");
    print(myServices.sharedPreferences.getString("userType"));
    // FirebaseMessaging.instance.subscribeToTopic("user$userid");

    getempvacationt();

    super.onInit();
  }
 
}
