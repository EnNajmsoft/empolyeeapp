import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';


class SignupData {
  Crud crud;
  SignupData(this.crud);


  postdata(
    String username ,
    String email ,
    String phone,
    String password,
    String token,
    String jopid,
    String usertype,
    ) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username , 
      "email" :   email , 
      "phone" :   phone  ,  
      "password": password, 
      "token":    token, 
      "jopid":    jopid, 
      "usertype": usertype, 
      

    });
    return response.fold((l) => l, (r) => r);
  }
}
