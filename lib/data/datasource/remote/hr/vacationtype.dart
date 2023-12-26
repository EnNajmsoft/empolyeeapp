import 'package:empolyeeapp/core/class/crud.dart';
import 'package:empolyeeapp/linkapi.dart';

class HrVacationtType {
  Crud crud;
  HrVacationtType(this.crud);


  getVacationType() async {
    var response = await crud.postData(AppLink.vacationtypeview, {});
    return response.fold((l) => l, (r) => r);
  }
  
  addvacationtTypedata(
    String vacationname,
    String vacationnote,
  ) async {
    var response = await crud.postData(AppLink.vacationttypeadd, {
      "vacation_name": vacationname,
      "vacation_note": vacationnote,
    });
    return response.fold((l) => l, (r) => r);
  }

  editvacationtTypedata(
    String vacationid,
    String vacationname,
    String vacationnote,
  ) async {
    var response = await crud.postData(AppLink.vacationtypeedit, {
      "vacation_id": vacationid,
      "vacation_name": vacationname,
      "vacation_note": vacationnote,
    });
    return response.fold((l) => l, (r) => r);
  } 
}
