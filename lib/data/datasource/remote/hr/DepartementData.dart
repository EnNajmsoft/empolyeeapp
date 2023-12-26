import 'package:empolyeeapp/core/class/crud.dart';
import 'package:empolyeeapp/linkapi.dart';

class DepartementData {
  Crud crud;
  DepartementData(this.crud);

  getDepartementData() async {
    var response = await crud.postData(AppLink.departmentview, {});
    return response.fold((l) => l, (r) => r);
  }

  addDepartementData(
    String departname,
    String departmanger,
    String departnote,
  ) async {
    var response = await crud.postData(AppLink.departmentadd, {
      "departname": departname,
      "departmanger": departmanger,
      "departnote": departnote,
    });
    return response.fold((l) => l, (r) => r);
  }

  editDepartementData(
    
    String departmentid,
    String departname,
    String departmanger,
    String departnote,
  ) async {
    var response = await crud.postData(AppLink.departmentedite, {
      
      "departmentid": departmentid,
      "departname": departname,
      "departmanger": departmanger,
      "departnote": departnote,
    });
    return response.fold((l) => l, (r) => r);
  }
}
