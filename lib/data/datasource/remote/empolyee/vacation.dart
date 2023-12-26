
import 'package:empolyeeapp/core/class/crud.dart';
import 'package:empolyeeapp/linkapi.dart';

class EmpuservacationtData {
  Crud crud;
  EmpuservacationtData(this.crud);

//================== view ====================
  getempvacData($userid) async {
    var response = await crud.postData(AppLink.empuservacatview, {"empid": $userid});
    return response.fold((l) => l, (r) => r);
  }


//================== add ====================

   addemployeevac($empvacationtype , $empidvacation, $empvacationstart, $empvacationend ,$empvacationnote,$empvacationfile , $departid ,$departmanger) async {
    var response = await crud.postData(AppLink.empuservacatadd,  {
          "emp_vacation_type":  $empvacationtype,
          "empid_vacation":     $empidvacation,
          "emp_vacation_start": $empvacationstart,
          "emp_vacation_end":   $empvacationend,
          "emp_vacation_note":  $empvacationnote,
          "emp_vacation_file":  $empvacationfile,
          "departid":           $departid,
          "departmanger":       $departmanger
          
          }
          );
    return response.fold((l) => l, (r) => r);
  }
}
