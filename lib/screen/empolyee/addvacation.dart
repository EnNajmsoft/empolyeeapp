import 'package:empolyeeapp/controller/empolyee/vacation/addcontroller.dart';
import 'package:empolyeeapp/data/model/vacationtype.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVacation extends StatelessWidget {
  final EmpvacAddcontrollerImp controller = Get.put(EmpvacAddcontrollerImp());
  // static const String appBarTitle = "اضفه اجازة موظف";

   AddVacation();

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("اضفه اجازة موظف"),
      ),
      body: Container(
        child: Form(
          key: controller.formstateaddvactmp,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.empvacationtype,
                        decoration: InputDecoration(
                          labelText: 'Vacation Type',
                          labelStyle: TextStyle(color: Colors.red),
                        ),
                        readOnly: true, // Make the TextField read-only
                        onTap: () {
                          showMenu(
                            context: context,
                            position:
                                RelativeRect.fromLTRB(0, 0, 0, 0),
                            items: controller.vacatype!.map((item) {
                              return PopupMenuItem<VacationTypeModel>(
                                value: item,
                                child: Text('${item.vacationTypeName}'),
                              );
                            }).toList(),
                          ).then((selectedValue) {
                            if (selectedValue != null) {
                              controller.vacatype!.first = selectedValue;
                              controller.empvacationtype.text =
                                  selectedValue.vacationTypeName!;
                                     controller.empvacationtype.text =
                                  selectedValue.vacationTypeName!;
                                       controller.empvacationtypeid = selectedValue.vacationTypeId!;
                              print(controller.empvacationtypeid);
                                  print(controller.empvacationtype.text);
                            }
                          });
                        },
                      ),
                    ),
              
                  ],
                ),
                buildDateTextField(
                  controller: controller.empvacationstart,
                  labelText: 'Start Date',
                  context: context,
                ),
                buildDateTextField(
                  controller: controller.empvacationend,
                  labelText: 'End Date',
                  context: context,
                ),
                TextField(
                  controller: controller.empvacationnote,
                  decoration: const InputDecoration(
                    labelText: 'Vacation Note',
                  ),
                ),
                TextField(
                  controller: controller.empvacationfile,
                  decoration: const InputDecoration(
                    labelText: 'File Start',
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  height: 100,
                  text: "Submit Vacation",
                  onTap: () {
                    controller.addvacationt();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDateTextField({
    required TextEditingController controller,
    required String labelText,
    required BuildContext context,
  }) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (pickedDate != null && pickedDate != controller.text) {
          controller.text =
              pickedDate.toString(); // You may format the date as needed
        }
      },
    );
  }
}

// import 'package:empolyeeapp/controller/empolyee/vacation/addcontroller.dart';
// import 'package:empolyeeapp/data/model/vacationtype.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddVacation extends StatelessWidget {
//   final EmpvacAddcontrollerImp controller = Get.put(EmpvacAddcontrollerImp());
//   static const String appBarTitle = "اضفه اجازة موظف";

//    AddVacation();

//   @override
//   Widget build(BuildContext context) {
//     Size? size = MediaQuery.of(context).size;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text(appBarTitle),
//       ),
//       body: Container(
//         child: Form(
//           key: controller.formstateaddvactmp,
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 PopupMenuButton<VacationTypeModel>(
//                   initialValue: controller.vacatype!.first,
//                   onSelected: (VacationTypeModel item) {
//                     print(
//                         "================size ${size.height} ====================");
//                     print("Selected vacation type: ${item.toString()}");
//                     controller.vacatype!.first = item;
//                   },
//                   itemBuilder: (BuildContext context) =>
//                       <PopupMenuEntry<VacationTypeModel>>[
//                     for (int i = 0; i < controller.vacatype!.length; i++)
//                       PopupMenuItem<VacationTypeModel>(
//                         value: controller.vacatype![i],
//                         child: Text('${controller.vacatype![i].vacationName}'),
//                       ),
//                   ],
//                   child: const Text('Select Vacation Type'),
//                 ),
//              TextField(
//                   controller: controller.empvacationtype,
//                   decoration: const InputDecoration(
//                     labelText: 'Vacation Type',
//                     labelStyle: TextStyle(color: Colors.red),
//                   ),
//                 ),   
//                 TextField(
//                   controller: controller.empvacationstart,
//                   decoration: const InputDecoration(
//                     labelText: 'Start Date',
//                   ),
//                 ),
//                 TextField(
//                   controller: controller.empvacationend,
//                   decoration: const InputDecoration(
//                     labelText: 'End Date',
//                   ),
//                 ),
//                 TextField(
//                   controller: controller.empvacationnote,
//                   decoration: const InputDecoration(
//                     labelText: 'Vacation Note',
//                   ),
//                 ),
//                 TextField(
//                   controller: controller.empvacationfile,
//                   decoration: const InputDecoration(
//                     labelText: 'File Start',
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 CustomButton(
//                   height: 100,
//                   text: "Submit Vacation",
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



// import 'package:empolyeeapp/controller/empolyee/vacation/addcontroller.dart';
// import 'package:empolyeeapp/data/model/vacationtype.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class Addvacation extends StatelessWidget {
//   EmpvacAddcontrollerImp controller = Get.put(EmpvacAddcontrollerImp());

//   Addvacation();

//   @override
//   Widget build(BuildContext context) {
//     Size? size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text("اضفه اجزه موظف"),
//       ),
//       // body: Container(
//       //   // height: 400,

//       //   //   width: 400,

//       //   color: Colors.red,
//       //   child: Text("Login to your\nAccount",
//       //       maxLines: null,
//       //       textAlign: TextAlign.left,
//       //       style: AppStyle.txtUrbanistRomanBold48),
//       // ),
//       body: Container(
//         child: Form(
//               key: controller.formstateaddvactmp,
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 PopupMenuButton<VacationTypeModel>(
//                   initialValue: controller.vacatype!.first,
//                   // Callback that sets the selected popup menu item.
//               onSelected: (VacationTypeModel item) {
//                               print("================size ${size.height} ====================");
      
//                     print("Selected vacation type: ${item.toString()}");
//                     controller.vacatype!.first = item;
      
//                   },
      
//                   itemBuilder: (BuildContext context) =>
      
//                    <PopupMenuEntry<VacationTypeModel>>[
//                     for (int i = 0; i < controller.vacatype!.length; i++)
//                       PopupMenuItem<VacationTypeModel>(
//                         value: controller.vacatype![i],
//                         child: Text('${controller.vacatype![i].vacationName}'),
//                       ),
//                   ],
//                 ),
//                  TextField(
//                       controller: controller.empvacationtype,
        
//                   decoration: const InputDecoration(
//                       labelText: ' ',
//                       labelStyle: TextStyle(color: Colors.red)),
//                 ),
                
//                  TextField(
//                       controller: controller.empvacationstart,
        
//                   decoration: const InputDecoration(
//                     labelText: 'تاريخ البدء',
//                   ),
//                 ),
//                  TextField(
//                       controller: controller.empvacationend,
        
//                   decoration: const InputDecoration(
//                     labelText: 'تاريخ الانتهاء',
//                   ),
//                 ),
//                  TextField(
//                       controller: controller.empvacationnote,
        
//                   decoration: const InputDecoration(
//                     labelText: 'ملاحظه الاجازة',
//                   ),
//                 ),
//                  TextField(
//                       controller: controller.empvacationfile,
        
//                   decoration: const InputDecoration(
//                     labelText: 'الملف البدء',
//                   ),
//                 ),
               
//                const SizedBox(height: 10),
//                 CustomButton(
//                   height: 100,
//                   text: "طلب الاجازة",
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
