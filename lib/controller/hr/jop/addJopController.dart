import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/DepartementData.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/JopData.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/data/model/JopModel.dart';
import 'package:empolyeeapp/data/model/usermodel.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class AddJopController extends GetxController {
  addJop();
  viewDepartement();
   viewJoopdep(departid);
}

class AddJopControllerImp extends AddJopController {
  DepartementData departementData = DepartementData(Get.find());
  JopData jopdata = JopData(Get.find());
  List<DepartementModel> departements = [];
  GlobalKey<FormState> formStateAddJop = GlobalKey<FormState>();
  List<JopModel> jopsdep = [];

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController jopName;
  late TextEditingController jopdepart;
  late TextEditingController jopNote;
  String? departid;
  @override
  addJop() async {
    if (formStateAddJop.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await jopdata.addJopData(
           departid!,
          jopName.text,
          jopNote.text);
      statusRequest = StatusRequest.success;
      if (response['status'] == "success") {
        print('=========suss add =========');
        Get.offNamed(AppRoutes.jopview);
      } else {}
    }
    update();
  }


  @override
  viewDepartement() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await departementData.getDepartementData();
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
  
  @override
  viewJoopdep(departid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await jopdata.getJopData(departid);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
      jopsdep.clear();
      jopsdep.addAll(responsedata.map((e) => JopModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
  @override
  void onInit() {
     viewDepartement() ;
    jopName = TextEditingController();
    jopNote = TextEditingController();
    jopdepart = TextEditingController();
    super.onInit();
  }
}
