import 'package:empolyeeapp/controller/hr/department/AddDepartController.dart';
import 'package:empolyeeapp/core/functions/alertexitapp.dart';
import 'package:empolyeeapp/data/model/usermodel.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDepartScreen extends StatelessWidget {
  final AddDepartcontrollerImp controller = Get.put(AddDepartcontrollerImp());

  AddDepartScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(" اضافة قسم جديد"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: controller.formStateAddDepar,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.departmentName,
                decoration: InputDecoration(
                  labelText: 'اسم  القسم',
                  labelStyle: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(height: 10),
                 Expanded(
                child: TextField(
                  controller: controller.departmentManger,
                  decoration: InputDecoration(
                    labelText: 'مدير',
                    labelStyle: TextStyle(color: Colors.red),
                  ),
                  readOnly: true, // Make the TextField read-only
                  onTap: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(0, 0, 0, 0),
                      items: controller.usersmodel!.map((item) {
                        return PopupMenuItem<UserModel>(
                          value: item,
                          child: Text('${item.userUsername}'),
                        );
                      }).toList(),
                    ).then((selectedValue) {
                      if (selectedValue != null) {
                        controller.usersmodel!.first = selectedValue;
                        controller.departmentManger.text =
                            selectedValue.userUsername!;
                        controller.departmentManger.text =
                            selectedValue.userUsername!;
                                  controller.mangerId= selectedValue.userId!;
                        print(controller.departmentManger.text);
                        print(controller.mangerId);
                      }
                    });
                  },
                ),
              ),
              TextFormField(
                controller: controller.departmentNote,
                decoration: InputDecoration(
                  labelText: 'ملاحظة حول القسم',
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                height: 50,
                text: "إضافة",
                onTap: () {
                  controller.addDepartement();
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
