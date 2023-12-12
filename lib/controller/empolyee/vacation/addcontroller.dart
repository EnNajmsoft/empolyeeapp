import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:empolyeeapp/core/services/services.dart';
import 'package:empolyeeapp/data/datasource/remote/admin/vacationtpye_admin_data.dart';
import 'package:empolyeeapp/data/datasource/remote/empolyee/vacation.dart';
import 'package:empolyeeapp/data/model/vacationtype.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

abstract class EmpvacAddcontroller extends GetxController {
  addvacationt();
  getvacationtype();
}

class EmpvacAddcontrollerImp extends EmpvacAddcontroller {

  MyServices myServices = Get.find();
  EmpuservacationtData empvacatData = EmpuservacationtData(Get.find());
  AdminvacationtData vacationtype = AdminvacationtData(Get.find());
  GlobalKey<FormState> formstateaddvactmp = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  List<VacationTypeModel>? vacatype = [];

  String? empidvacation ;
  String? empvacationtypeid;
  
  late TextEditingController empvacationtype;
  late TextEditingController empvacationstart;
  late TextEditingController empvacationend;
  late TextEditingController empvacationnote;
  late TextEditingController empvacationfile;


  @override
  addvacationt() async {
    if (formstateaddvactmp.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      print( empvacationtypeid);
      print( empidvacation);
      print( empvacationstart.text);
      print( empvacationend.text);
      print(empvacationnote.text);
      print(empvacationfile.text);

      update();
      var response = await empvacatData.addemployeevac(
       empvacationtypeid,
        empidvacation,
        empvacationstart.text,
        empvacationend.text,
        empvacationnote.text,
        empvacationfile.text,
      );
      statusRequest = StatusRequest.success;
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.emphome);
      } else {

      }
    }
    update();
  }



  @override
  getvacationtype() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await vacationtype.getevacTypeData();
    print(
        "=============================== vacation Type user 1 ============= $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];

     
          vacatype!.clear();
          vacatype!.addAll(responsedata.map((e) => VacationTypeModel.fromJson(e)));
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  @override
  void onInit() {
        empidvacation = myServices.sharedPreferences.getString("id");
   
        empvacationtype = TextEditingController();
        empvacationstart = TextEditingController();
        empvacationend = TextEditingController();
        empvacationnote = TextEditingController();
        empvacationfile = TextEditingController();
  getvacationtype();
    super.onInit();
  }
}
