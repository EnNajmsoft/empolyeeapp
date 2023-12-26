import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/alertelogoteadmin.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class Empvacatcontroller extends GetxController {
  getempvacationt();
  filterData(String valu);
  approvalvac(empVacationId);
  rejectvac(empVacationId);
  getempvacationtOne(empId);
  onInit();
}

class EmpvacatcontrollerImp extends Empvacatcontroller {
  AdminvacationtData empvacatData = AdminvacationtData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<EmpVacationModel> empVacations = [];
  List<EmpVacationModel> empvactall = [];
  List<EmpVacationModel> empvacwait = [];
  List<EmpVacationModel> empvactaprov = [];
  List<EmpVacationModel> empvactanjc = [];
  List<EmpVacationModel> empvactone = [];

  @override
  getempvacationt() async {
    statusRequest = StatusRequest.loading;
    var response = await empvacatData.getempvacData();
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

  @override
  approvalvac(empVacationId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await empvacatData.aprrovacation(empVacationId);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      empvactanjc.removeWhere((element) => element.empVacationId == empVacationId);
      print('chang ssssssssss');
       getempvacationt();
      
    } else {}

    update();
  }

  @override
  rejectvac(empVacationId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await empvacatData.rejectvacation(empVacationId);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      empvactaprov
          .removeWhere((element) => element.empVacationId == empVacationId);
      update();
      print('chang ssssssssss');
        getempvacationt();
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
  

geytoken()async{
//  String? token= await FirebaseMessaging.instance.getToken();
    print('=======================================');
    // print('$token');

    print('=======================================');
    // await FirebaseMessaging.instance.subscribeToTopic('hr');
}
  @override
  void onInit() {
    String username = myServices.sharedPreferences.getString("step")!;
    print('================$username=======================');

    getempvacationt();
   geytoken();
    super.onInit();
  }
}


// import 'package:empolyeeapp/core/class/statusrequest.dart';
// import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
// import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
// import 'package:empolyeeapp/data/model/empvacation.dart';
// import 'package:empolyeeapp/routes/app_routes.dart';
// import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';

// abstract class Empvacatcontroller extends GetxController {
//   getempvacationt();
//   felterdata(String valu);
//   onInit();
// }

// class EmpvacatcontrollerImp extends Empvacatcontroller {
//   AdminvacationtData empvacatData = AdminvacationtData(Get.find());

//   StatusRequest statusRequest = StatusRequest.none;

//   List<EmpVacation> empVacations = [];
//   List<EmpVacation> empvactall = [];
//   List<EmpVacation> empvacwait = [];
//   List<EmpVacation> empvactaprov = [];
//   List<EmpVacation> empvactanjc = [];

//   getempvacationt() async {
//     statusRequest = StatusRequest.loading;
//     var response = await empvacatData.getempvacData();
//     print("=============================== va============= $response ");
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
       
//         List responsedata = response['data'];
//          empvactall.clear();
//         empvactall.addAll(responsedata.map((e) => EmpVacation.fromJson(e)));
       
//         print(
//             "=============================== valisssssallllllllllllssst============= $empvactall ");
//                   empvacwait.clear();
//         empvacwait.addAll(responsedata.map((e) => EmpVacation.fromJson(e)));
//         empvacwait.removeWhere((element) => element.empVacationState != "0");
//         print(
//             "=============================== aprooooovvvllllllll============= $empvacwait ");
//         empvactaprov.clear();
//         empvactaprov.addAll(responsedata.map((e) => EmpVacation.fromJson(e)));
//         empvactaprov.removeWhere((element) => element.empVacationState != "1");
//         print(
//             "=============================== aprooooovvvllllllll============= $empvactaprov ");
//         empvactanjc.clear();
//         empvactanjc.addAll(responsedata.map((e) => EmpVacation.fromJson(e)));
//         empvactanjc.removeWhere((element) => element.empVacationState != "2");
//         print(
//             "=============================== anjjjjjjjjct============= $empvactanjc ");
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }

//   @override
//   felterdata(String valu) {
//     if (valu == '1') {
//       empvact.clear();
//       empVacations = empvactaprov;
//       print("=============================== flter aprooov============= $empvactaprov  ");
//     } else if (valu == '2') {
//       empvact.clear();
//       empvact.addAll(empvactaprov);

//       print("=============================== flter enjeeecc============= $empvactanjc  ");
//     } else if (valu == '0') {
//       empvact.clear();
//       empVacations = empvacwait;
//       print("=============================== flter wit============= $empvacwait ");
//     } else {
//       empvact.clear();
//       empVacations = empvactall;
//       print(
//           "=============================== flter dufolt all============= $empvactall ");
//     }
   
//     update();
//   }

//   gotoVacation(EmpVacation vacation) {
//     Get.toNamed(AppRoutes.onevacation, arguments: {"vacationmodel": vacation});
//   }

//   @override
//   void onInit() {
//     getempvacationt();

//     super.onInit();
//   }
// }
