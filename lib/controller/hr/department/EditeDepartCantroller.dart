// hotelModel   = Get.arguments['hotelModel'];

import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/DepartementData.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/data/model/usermodel.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class EditeDepartcontroller extends GetxController {
  editeDepartement();
  getusersAdmin();
  initialData();
}

class EditeDepartcontrollerImp extends EditeDepartcontroller {
  DepartementData departementData = DepartementData(Get.find());
  UserData userData = UserData(Get.find());

  GlobalKey<FormState> formStateAddDepar = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  List<UserModel>? usersmodel = [];
  DepartementModel? departmenModel;
  late TextEditingController departmentName;
  late TextEditingController departmentManger;
  late TextEditingController departmentNote;
  String? mangerId;
  String? mangerName;
  String? departIdargum;
  String? departNameargum;
  String? departNoteargum;

  @override
  editeDepartement() async {
    if (formStateAddDepar.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
     
        print('=========$mangerId =========');

      var response = await departementData.editDepartementData(
          departIdargum!, departmentName.text, mangerId!, departmentNote.text);
      statusRequest = StatusRequest.success;
      if (response['status'] == "success") {
        print('=========suss edite =========');
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
      usersmodel!.clear();
      usersmodel!.addAll(responsedata.map((e) => UserModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  initialData() {
        print('=========$mangerId =========');

    departmenModel = Get.arguments['departModel'];
    departmentName = TextEditingController();
    departmentNote = TextEditingController();
    departmentManger = TextEditingController();
    departIdargum = departmenModel!.departId!;
    mangerName = departmenModel!.userUsername;
    departmentName.text = departmenModel!.departName!;
    departmentNote.text = departmenModel!.departNote!;
  }

  @override
  void onInit() {
    getusersAdmin();
    initialData();
    super.onInit();
  }
}
