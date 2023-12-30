import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/DepartementData.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
import 'package:empolyeeapp/data/model/usermodel.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class AddDepartcontroller extends GetxController {
  addDepartement();
getusersAdmin();
  onInit();
}

class AddDepartcontrollerImp extends AddDepartcontroller {
  DepartementData departementData = DepartementData(Get.find());
  UserData userData = UserData(Get.find());

  GlobalKey<FormState> formStateAddDepar = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  List<UserModel>? usersmodel = [];

  late TextEditingController departmentName;
  late TextEditingController departmentManger;
  late TextEditingController departmentNote;
  String? mangerId = "1";

  @override
  addDepartement() async {
    if (formStateAddDepar.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await departementData.addDepartementData(
        departmentName.text,
        // departmentManger.text,
        mangerId!,
        departmentNote.text
        

      );
      statusRequest = StatusRequest.success;
      if (response['status'] == "success") {
        print('=========suss add =========');
        Get.offNamed(AppRoutes.departementview);
      } else {}
    }
    update();
  }

  @override
  getusersAdmin() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.getAllUserData();
    print(
        "=============================== vacation Type user 1 ============= $response ");
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
   
      usersmodel = response['data']
          .map<UserModel>((e) => UserModel.fromJson(e))
          .where((element) =>
              element.userApproval == "3" && element.userType == "1")
          .toList();
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
  
  
  @override
  void onInit() {
     getusersAdmin();
    departmentName    = TextEditingController();
    departmentNote    = TextEditingController();
    departmentManger  = TextEditingController();
    super.onInit();
  }
}
