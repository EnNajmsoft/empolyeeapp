import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:empolyeeapp/data/model/usermodel.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class HRUserController extends GetxController {
  viewwitUser();
  approvaluser(userid);
  rejectuser(userid);
  // getempvacationtOne(empId);
  onInit();
}

class HRUserControllerImp extends HRUserController {
  UserData userData = UserData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  List<UserModel> witUsers = [];
  

  @override
  viewwitUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.getWitUserData();
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
      witUsers.clear();
      witUsers.addAll(responsedata.map((e) => UserModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  approvaluser(userid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.aprroUser(userid);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      witUsers.removeWhere((element) => element.userId == userid);
      print('chang ssssssssss approvaluser');
    } else {
            print('chang error');

    }

    update();
  }

  @override
  rejectuser(userid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.rejectUser(userid);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
     
      witUsers.removeWhere((element) => element.userId == userid);
      update();
      print('chang ssssssssss rejectuser');
    } else {
            print('chang error');

    }

    update();
  }

 

  // @override
  // getempvacationtOne(empId) async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await empvacatData.getempvacDataOne(empId);
  //   print("=============================== va   one============= $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       List responsedata = response['data'];
  //       empvactone.clear();
  //       empvactone
  //           .addAll(responsedata.map((e) => EmpVacationModel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  @override
  void onInit() {
    viewwitUser();

    super.onInit();
  }
}

