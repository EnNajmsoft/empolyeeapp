import 'package:empolyeeapp/controller/hr/vacationeType/addController.dart';
import 'package:empolyeeapp/core/functions/alertexitapp.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVacationScreen extends StatelessWidget {
  final AddcontrollerImp controller = Get.put(AddcontrollerImp());

  AddVacationScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("طلب إجازة"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: controller.formstateaddvact,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.vacationname,
                decoration: InputDecoration(
                  labelText: 'اسم نوع الإجازة',
                  labelStyle: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.vacationnote,
                decoration: InputDecoration(
                  labelText: 'ملاحظة الإجازة',
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                height: 50,
                text: "إضافة",
                onTap: () {
                  controller.addvacationt();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:empolyeeapp/controller/admin/vacationType/addController.dart';
// import 'package:empolyeeapp/core/functions/alertexitapp.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class addVacationtScreen extends StatelessWidget {
//   AddcontrollerImp controller = Get.put(AddcontrollerImp());

//   addVacationtScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("طلب اجازه"),
//       ),
//       body: WillPopScope(
//         onWillPop: alertExitApp,
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: controller.formstateaddvact,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                  TextField(
//                   controller: controller.vacationname,
//                   decoration: const InputDecoration(
//                       labelText: 'اسم نوع الاجازه ',
//                       labelStyle: TextStyle(color: Colors.red)),
//                 ),
//                  TextField(
//                   controller: controller.vacationnote,

//                   decoration: const InputDecoration(
//                     labelText: 'ملاحظه الاجازة',
//                   ),
//                 ),
//                const SizedBox(height: 10),
//                 CustomButton(
//                   height: 50,
//                   text: "اضافة ",
//                   onTap: () {
//                     controller.addvacationt();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
