import 'dart:io';

import 'package:empolyeeapp/core/class/crud.dart';
import 'package:empolyeeapp/linkapi.dart';


class AdminvacationtData {
  Crud crud;
  AdminvacationtData(this.crud);


  
  //////rrr
  getempvacData() async {
    var response = await crud.postData(AppLink.empvacatview, {});
    return response.fold((l) => l, (r) => r);
  }
    getempvacDataOne(empvacationid) async {
    var response = await crud.postData(AppLink.empvacatviewone, {
     "empid" : empvacationid
    });
    return response.fold((l) => l, (r) => r);
  }
aprrovacation(empvacationid) async {
    var response = await crud.postData(AppLink.approvalvac, {
      "emp_vacation_id": empvacationid,
    });
    return response.fold((l) => l, (r) => r);
  }

  rejectvacation(empvacationid) async {
    var response = await crud.postData(AppLink.rejectvac, {
      "emp_vacation_id": empvacationid,
    });
    return response.fold((l) => l, (r) => r);
  }
  getevacTypeData() async {
    var response = await crud.postData(AppLink.vacationtypeview, {});
    return response.fold((l) => l, (r) => r);
  }

/////////////admin

  getEmpVacDeparData(departid) async {
    var response = await crud.postData(AppLink.empvacatdepview, {
       "departid": departid,
    });
    return response.fold((l) => l, (r) => r);
  }

aprroAdminvacation(empvacationid) async {
    var response = await crud.postData(AppLink.approvalAdminvac, {
      "emp_vacation_id": empvacationid,
    });
    return response.fold((l) => l, (r) => r);
  }

  rejectAdminvacation(empvacationid) async {
    var response = await crud.postData(AppLink.rejectAdminvac, {
      "emp_vacation_id": empvacationid,
    });
    return response.fold((l) => l, (r) => r);
  }
//================== employee ====================

//================== view ====================
  getempvacuserData($userid) async {
    var response =
        await crud.postData(AppLink.empuservacatview, {"empid": $userid});
    return response.fold((l) => l, (r) => r);
  }

//================== add ====================

  addemployeevac($empvacationtype, $empidvacation, $empvacationstart,
      $empvacationend, $empvacationnote, $empvacationfile) async {
    var response = await crud.postData(AppLink.empuservacatadd, {
      "emp_vacation_type": $empvacationtype,
      "empid_vacation": $empidvacation,
      "emp_vacation_start": $empvacationstart,
      "emp_vacation_end": $empvacationend,
      "emp_vacation_note": $empvacationnote,
      "emp_vacation_file": $empvacationfile,
    });
    return response.fold((l) => l, (r) => r);
  }

}
