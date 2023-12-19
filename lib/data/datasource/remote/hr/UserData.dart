import 'package:empolyeeapp/core/class/crud.dart';
import 'package:empolyeeapp/linkapi.dart';

class UserData {
  Crud crud;
  UserData(this.crud);
  getAllUserData() async {
    var response = await crud.postData(AppLink.userview, {});
    return response.fold((l) => l, (r) => r);
  }

  getDeparUserData(departId) async {
    var response = await crud.postData(AppLink.userviewdep, {
      "departid": departId,
    });
    return response.fold((l) => l, (r) => r);
  }

  getWitUserData() async {
    var response = await crud.postData(AppLink.viewwituser, {});
    return response.fold((l) => l, (r) => r);
  }

  aprroUser(userid) async {
    var response = await crud.postData(AppLink.approvaluser, {
      "user_id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
  
  rejectUser(userid) async {
    var response = await crud.postData(AppLink.rejectuser, {
      "user_id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
