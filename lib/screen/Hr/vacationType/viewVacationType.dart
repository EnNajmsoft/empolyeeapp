import 'package:empolyeeapp/controller/hr/vacationeType/VacTepyController.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VacationTpyeView extends StatelessWidget {
  final VeiwVacTepycontrollerImp controller =
      Get.put(VeiwVacTepycontrollerImp());

  VacationTpyeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الإجازة'),
      ),
          floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(AppRoutes.addvacationtscreen);
        },
        child: const Icon(Icons.add_card),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<VeiwVacTepycontrollerImp>(
          builder: (controller) => ListView.separated(
            itemCount: controller.vacationTypes.length,
            separatorBuilder: (context, index) => SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _buildUserInfoCard(' انواع الاجازات ', {
                'vacation_name': controller.vacationTypes[index].vacationTypeName,
                'vacation_note': controller.vacationTypes[index].vacationTypeNote,
              });
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildUserInfoCard(String title, Map<String, dynamic> userData) {
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
            'اسم المستخدم: ${userData['vacation_name']}',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          Text(
            'البريد الإلكتروني: ${userData['vacation_note']}',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}




// Card(
//       child: ListTile(
//         title: Text(
//           title,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'اسم المستخدم: ${userData['vacation_name']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               'البريد الإلكتروني: ${userData['vacation_note']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );