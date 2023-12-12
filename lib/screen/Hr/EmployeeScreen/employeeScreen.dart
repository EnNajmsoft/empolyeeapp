
import 'package:empolyeeapp/controller/hr/department/viewDepartController.dart';
import 'package:empolyeeapp/controller/hr/employee/employeeViewController.dart';
import 'package:empolyeeapp/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
class EmployeeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('موظفين القسام'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<EmployeeViewControllerImp>(
          init: EmployeeViewControllerImp(), // قم بتهيئة الكنترولر هنا
          builder: (controller) => Expanded(
            child: ListView.builder(
              itemCount: controller.depusers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Get.bottomSheet(vacationBottomsheet(
                    //     empvacation: controller.depusers[index]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _buildUserInfoCard(
                      ' بيانات الموظف ',
                      {
                        'employeeName': controller.depusers[index].userUsername,
                        'employeeEmail': controller.depusers[index].userEmail,
                        'employeePhone': controller.depusers[index].userPhone,
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:empolyeeapp/controller/hr/department/viewDepartController.dart';
// import 'package:empolyeeapp/controller/hr/employee/employeeViewController.dart';
// import 'package:empolyeeapp/core/utils/size_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class EmployeeScreen extends StatelessWidget {
//   EmployeeViewControllerImp controller = Get.put(EmployeeViewControllerImp());

//    EmployeeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(' موظفين القسام'),
//       ),
    
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Expanded(
//           child: GetBuilder<EmployeeViewControllerImp>(
//             builder: (controller) => ListView.builder(
//                 itemCount: controller.depusers.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       // Get.bottomSheet(vacationBottomsheet(
//                       //     empvacation: controller.depusers[index]));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(4.0),
//                       child: _buildUserInfoCard(
//                           ' بيانات الموظف ' , {
//                         'employeeName': controller
//                             .depusers[index].userUsername,
//                         'employeeEmail': controller
//                             .depusers[index]
//                             .userEmail,
//                         'employeePhone': controller
//                             .depusers[index].userPhone,
//                       }),
//                     ),
//                   );
//                 }),
//           ),
//         ),
//       ),
//     );
//   }
// }

Widget _buildUserInfoCard(String title, Map<String, dynamic> employeeData) {
  return Card(
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اسم الموظف: ${employeeData['employeeName']}',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          Text(
            'ايميل الموظف : ${employeeData['employeeEmail']}',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          Text(
            'رقم الموظف : ${employeeData['employeePhone']}',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}


// employeeScreen
//  Scaffold(
//       appBar: AppBar(
//         title: Text(' الاقسام'),
//       ),
//        floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.offNamed(AppRoutes.addepartscreen);
//         },
//         child: const Icon(Icons.add_card),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Expanded(
//           child: GetBuilder<VeiwDepartcontrollerImp>(
//             builder: (controller) => Padding(
//               padding: getPadding(top: 22, right: 14, left: 14),
//               child: ListView.builder(
//                   itemCount: controller.departements.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         Get.bottomSheet(vacationBottomsheet(
//                             empvacation: controller.departements[index]));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: _buildUserInfoCard(
//                             'بيانات القسم', {
//                           'depart_name': controller
//                               .departements[index].departName,
//                           'depart_manger': controller
//                               .departements[index]
//                               .departManger,
//                           'depart_note': controller
//                               .departements[index].departNote,
//                         }),
//                       ),
//                     );
//                   }),
//             ),
//           ),
//         ),
//       ),
//     );
//  Card(
//     child: ListTile(
//       title: Text(
//         title,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.blue,
//         ),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'اسم القسم: ${departData['depart_name']}',
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//           ),
//           Text(
//               'ملاحظة : ${departData['depart_manger']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               'ملاحظة : ${departData['depart_note']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//         ],
          
//       ),
//     ),
//   );