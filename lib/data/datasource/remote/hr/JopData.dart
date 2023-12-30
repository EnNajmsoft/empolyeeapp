import 'package:empolyeeapp/core/class/crud.dart';
import 'package:empolyeeapp/linkapi.dart';

class JopData {
  Crud crud;
  JopData(this.crud);

  getAllJopData() async {
    var response = await crud.postData(AppLink.jopviewall, {});
    return response.fold((l) => l, (r) => r);
  }

  getJopData(
    String departid,
  ) async {
    var response = await crud.postData(AppLink.jopviewa, {
      "departid": departid,

    });
    return response.fold((l) => l, (r) => r);
  }

  addJopData(
    String departid,
    String jopname,
    String jopnote,
  ) async {
    var response = await crud.postData(AppLink.jopadd, {
      "depart_id": departid,
      "jop_name": jopname,
      "jop_note": jopnote,
    });
    return response.fold((l) => l, (r) => r);
  }
}
