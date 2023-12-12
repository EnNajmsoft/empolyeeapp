import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/alertelogoteadmin.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/DepartementData.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/data/model/usermodel.dart';
import 'package:get/get.dart';

abstract class EmployeeViewController extends GetxController {
  viewAllUser();
viewUserDepart();
initialData();
}

class EmployeeViewControllerImp extends EmployeeViewController {
  UserData userData = UserData(Get.find());
  List<UserModel> allusers = [];
  List<UserModel> depusers = [];
DepartementModel? departement;
 String? departid;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  viewAllUser() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.getAllUserData();
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
      allusers.clear();
      allusers.addAll(responsedata.map((e) => UserModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  @override
  viewUserDepart() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userData.getDeparUserData(
departid
    );
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
      depusers.clear();
      depusers.addAll(responsedata.map((e) => UserModel.fromJson(e)));
    } else {
      print('=====================errrrrrrrrr================');

      statusRequest = StatusRequest.failure;
    }

    update();
  }
  @override


  @override
  initialData() {
  
departid = myServices.sharedPreferences.getString("departId");
  }

  @override
  void onInit() {
    initialData();
    viewAllUser();
      viewUserDepart() ;
    super.onInit();
  }
}
