import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/vacationtype.dart';
import 'package:empolyeeapp/data/model/vacationtype.dart';
import 'package:get/get.dart';

abstract class VeiwVacTepycontroller extends GetxController {
 viewVacationtTepy();

  onInit();
}

class VeiwVacTepycontrollerImp extends VeiwVacTepycontroller {
  HrVacationtType vacationtTepyData = HrVacationtType(Get.find());
  List<VacationTypeModel> vacationTypes = [];


  StatusRequest statusRequest = StatusRequest.none;


  @override
  viewVacationtTepy() async {
      statusRequest = StatusRequest.loading;
      update();
      var response = await vacationtTepyData.getVacationType();
      statusRequest = StatusRequest.success;
          if (response['status'] == "success") {
      print('======================$response================');

      List responsedata = response['data'];
      vacationTypes.clear();
      vacationTypes.addAll(responsedata.map((e) => VacationTypeModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }
    
    update();
  }

  @override
  void onInit() {
   viewVacationtTepy();
    super.onInit();
  }
}
