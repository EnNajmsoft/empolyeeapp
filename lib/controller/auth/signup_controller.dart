import 'package:empolyeeapp/core/class/statusrequest.dart';
import 'package:empolyeeapp/core/functions/handingdatacontroller.dart';
import 'package:country_pickers/country.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/DepartementData.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/JopData.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/data/model/JopModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../data/datasource/remote/auth/signup.dart';
import '../../routes/app_routes.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  showPassword();
  viewDepartement();
viewJoopdep(departid);
}

class SignUpControllerImp extends SignUpController {

  GlobalKey<FormState> formstatetow = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  late TextEditingController username;
  late TextEditingController userlastname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController depart;
  late TextEditingController jopid;
  late TextEditingController password;
  late Country selectedCountry;
  late String? token;
  late String? jopselect;
  late String? usertype;
  bool switchselect = false;
  bool isshowpassword = true;

  DepartementData departementData = DepartementData(Get.find());
  List<DepartementModel> departements = [];
  String? departid;

  JopData jopdata = JopData(Get.find());
  List<JopModel> jopsdep = [];




  @override
  signUp() async {
    if (formstatetow.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
          username.text, 
          email.text, phone.text,
          password.text, 
          token!,
          jopselect!,
          usertype!);
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.toNamed(AppRoutes.virifycodesingupScreen,
              arguments: {"email": email.text});
          // Get.toNamed(AppRoutes.signInScreen);
          print(
              "==================================================$response============================");

        } else {
          Get.defaultDialog(title: "فففف", middleText: "فففف");
          statusRequest = StatusRequest.failure;
          print(
              "==================================================rorr1============================");

        }
      }
      update();
    } else {
      Get.defaultDialog(title: "فف222فف", middleText: "ف2222ففف");
      statusRequest = StatusRequest.failure;
             print(   "==================================================rorr21============================");

    }
  }

  // @override
  // viewJoop() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await jopdata.getAllJopData();
  //   statusRequest = StatusRequest.success;
  //   if (response['status'] == "success") {
  //     print('======================$response================');
  //     List responsedata = response['data'];
  //     jops.clear();
  //     jops.addAll(responsedata.map((e) => JopModel.fromJson(e)));
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }

  //   update();
  // }

  @override
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
showjop(){
if(switchselect==false){
  print(switchselect);
  switchselect==true;
  usertype = '0';
  update();
}else {
  print(switchselect);
  switchselect==false;
  usertype = '1';

  update();


}
    update();

}
  @override
  viewDepartement() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await departementData.getDepartementData();
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
      print('======================$response================');
      List responsedata = response['data'];
      departements.clear();
      departements
          .addAll(responsedata.map((e) => DepartementModel.fromJson(e)));
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
  @override
  viewJoopdep(departid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await jopdata.getJopData(departid);
    statusRequest = StatusRequest.success;
    if (response['status'] == "success") {
       jopid.text = ' حدد الوظيفة';

      print('======================$response================');
      List responsedata = response['data'];
      jopsdep.clear();
      jopsdep.addAll(responsedata.map((e) => JopModel.fromJson(e)));
    } else {
       jopsdep.clear();
       jopid.text ="لا توجد وظئف بعد";
      statusRequest = StatusRequest.failure;
    update();
      


    }

    update();
  }
  onTapSignup() {
    Get.toNamed(AppRoutes.fillProfileScreen);
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.signInScreen);
  }

  geytoken() async {
    token = await FirebaseMessaging.instance.getToken();
    print('=======================================');
    print('$token');
  }

  @override
  void onInit() {
     viewDepartement();
    geytoken();
    username     = TextEditingController();
    userlastname = TextEditingController();
    email        = TextEditingController();
    phone        = TextEditingController();
    jopid        = TextEditingController();
    depart       = TextEditingController();
    password     = TextEditingController();

    super.onInit();
  }


}
