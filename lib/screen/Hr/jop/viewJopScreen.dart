import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/controller/hr/jop/viewJopController.dart';
import 'package:empolyeeapp/routes/app_routes.dart';

class ViewJopScreen extends StatelessWidget {
  late final ViewJopControllerImp controller;

  ViewJopScreen() : controller = Get.put(ViewJopControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل وظيفة'),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildJopListView(),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.offNamed(AppRoutes.addjop);
      },
      child: const Icon(Icons.add_card),
    );
  }

  Widget _buildJopListView() {
    return GetBuilder<ViewJopControllerImp>(
      builder: (controller) => ListView.separated(
        itemCount: controller.jops.length,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (context, index) {
          return _buildUserInfoCard('  وظائف ', {
            'اسم الوظيفة': controller.jops[index].jopName,
            'ملاحظات الوظيفة': controller.jops[index].jopNote,
          });
        },
      ),
    );
  }

  Widget _buildUserInfoCard(String title, Map<String, dynamic> jopsData) {
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
              'اسم الوظيفة: ${jopsData['اسم الوظيفة']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              'ملاحظات الوظيفة: ${jopsData['ملاحظات الوظيفة']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:empolyeeapp/controller/hr/jop/viewJopController.dart';
// import 'package:empolyeeapp/controller/hr/vacationeType/VacTepyController.dart';
// import 'package:empolyeeapp/routes/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ViewJopScreen extends StatelessWidget {
//   final ViewJopControllerImp controller =
//       Get.put(ViewJopControllerImp());

//   ViewJopScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تفاصيل وظيفة'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.offNamed(AppRoutes.addjop);
//         },
//         child: const Icon(Icons.add_card),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GetBuilder<ViewJopControllerImp>(
//           builder: (controller) => ListView.separated(
//             itemCount: controller.jops.length,
//             separatorBuilder: (context, index) => SizedBox(height: 8),
//             itemBuilder: (context, index) {
//               return _buildUserInfoCard('  jops ', {
//                 'jop_name':
//                     controller.jops[index].jopName,
//                 'jop_note':
//                     controller.jops[index].jopNote,
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _buildUserInfoCard(String title, Map<String, dynamic> jopsData) {
//   return Card(
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
//             'اسم المستخدم: ${jopsData['jop_name']}',
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//           ),
//           Text(
//             'البريد الإلكتروني: ${jopsData['jop_note']}',
//             style: TextStyle(
//               color: Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
