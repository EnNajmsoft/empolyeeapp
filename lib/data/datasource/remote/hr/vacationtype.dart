import 'package:empolyeeapp/core/class/crud.dart';
import 'package:empolyeeapp/linkapi.dart';

class HrVacationtType {
  Crud crud;
  HrVacationtType(this.crud);


  getVacationType() async {
    var response = await crud.postData(AppLink.vacationtypeview, {});
    return response.fold((l) => l, (r) => r);
  }
  
  addVacationtType(
    String vacationname,
    String vacationnote,
  ) async {
    var response = await crud.postData(AppLink.vacationtadd, {
      "vacation_name": vacationname,
      "vacation_note": vacationnote,
    });
    return response.fold((l) => l, (r) => r);
  }

}
