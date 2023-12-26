import 'package:flutter/material.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';

class OneVacationScreen extends StatelessWidget {
  final EmpVacationModel itemVacation;

  OneVacationScreen({required this.itemVacation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الإجازة'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                       buildInfoSection('بيانات الموظف', '${itemVacation.userUsername}',
                '${itemVacation.userEmail}'),

            buildInfoSection('بيانات الوظيفة', '${itemVacation.jopName}',
                '${itemVacation.jopNote}'),

            buildInfoSection('بيانات القسم', '${itemVacation.departName}',
                '${itemVacation.departManger}', '${itemVacation.departNote}'),
                
            buildInfoSection('نوع الإجازة', itemVacation.vacationTypeName!),

            buildInfoSection(
                'تاريخ بداية الإجازة', itemVacation.vacationStart!),
            buildInfoSection('تاريخ نهاية الإجازة', itemVacation.vacationEnd!),
            buildInfoSection(
                'حالة الإجازة',
                itemVacation.vacationStateHr == '0'
                    ? 'قيد المراجعة'
                    : itemVacation.vacationStateHr == '1'
                        ? 'تمت الموافقة'
                        : 'تمت الرفض'),
            buildInfoSection('ملاحظات', itemVacation.vacationNote!),
            buildInfoSection('ملف الإجازة', itemVacation.vacationFile!),
            buildInfoSection('تاريخ الإنشاء', itemVacation.vacationCreate!),
 
          ],
        ),
      ),
    );
  }

  Widget buildInfoSection(String title, String value1,
      [String? value2, String? value3]) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Divider(),
            Text(
              value1,
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            if (value2 != null) Text(value2),
            if (value3 != null) Text(value3),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:empolyeeapp/data/model/empvacation.dart';

// class OneVacationScreen extends StatelessWidget {
//   final EmpVacationModel itemVacation;

//   OneVacationScreen({required this.itemVacation});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تفاصيل الإجازة'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             buildInfoSection('تاريخ بداية الإجازة', itemVacation.vacationStart!),
//             buildInfoSection('تاريخ نهاية الإجازة', itemVacation.vacationEnd!),
//             buildInfoSection('نوع الإجازة', itemVacation.vacationTypeName!),
//             buildInfoSection(
//                 'حالة الإجازة',
//                 itemVacation.vacationStateHr == '0'
//                     ? 'قيد المراجعة'
//                     : itemVacation.vacationStateHr == '1'
//                         ? 'تمت الموافقة'
//                         : 'تمت الرفض'),
//             buildInfoSection('ملاحظات', itemVacation.vacationNote!),
//             buildInfoSection('ملف الإجازة', itemVacation.vacationFile!),
//             buildInfoSection('تاريخ الإنشاء', itemVacation.vacationCreate!),
//             buildInfoSection('بيانات الموظف', '${itemVacation.userUsername}',
//                 '${itemVacation.userUsername}'),
//             buildInfoSection('بيانات الوظيفة', '${itemVacation.jopName}',
//                 '${itemVacation.jopNote}'),
//             buildInfoSection('بيانات القسم', '${itemVacation.departName}',
//                 '${itemVacation.departManger}', '${itemVacation.departNote}'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildInfoSection(String title, String value1,
//       [String? value2, String? value3]) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             Divider(),
//             Text(
//               value1,
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//             if (value2 != null) Text(value2),
//             if (value3 != null) Text(value3),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:empolyeeapp/data/model/empvacation.dart';
// import 'package:flutter/material.dart';

// class oneVacationScreen extends StatelessWidget {
//   final EmpVacationModel itemVacation;

//   oneVacationScreen({required this.itemVacation});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تفاصيل الإجازة'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             _buildInfoCard(
//                 'تاريخ بداية الإجازة', itemVacation.vacationStart),
//             _buildInfoCard('تاريخ نهاية الإجازة', itemVacation.vacationEnd),
//             _buildInfoCard('نوع الإجازة', itemVacation.vacationTypeName),
//             _buildInfoCard(
//               'حالة الإجازة',
//               itemVacation.vacationStateHr == '0'
//                   ? 'قيد المراجعة'
//                   : itemVacation.vacationStateHr == '1'
//                   ? 'تمت الموافقة'
//                   : 'تمت الرفض'
//             ),
//             _buildInfoCard('ملاحظات', itemVacation.vacationNote),
//             _buildInfoCard('ملف الإجازة', itemVacation.vacationFile),
//             _buildInfoCard('تاريخ الإنشاء', itemVacation.vacationCreate),
//             _buildUserInfoCard('بيانات الموظف', {
//               'user_username': itemVacation.userUsername,
//               'user_email': itemVacation.userUsername,
//             }),
//             _buildJobInfoCard('بيانات الوظيفة', {
//               'jop_name': itemVacation.jopName,
//               'jop_note': itemVacation.jopNote,
//             }),
//             _buildDepartmentInfoCard('بيانات القسم', {
//               'depart_name': itemVacation.departName,
//               'depart_manger': itemVacation.departManger,
//               'depart_note': itemVacation.departNote,
//             }),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard(String title, value) {
//     return Card(
//       child: ListTile(
//         title: Text(
//           title,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.blue, // Adjust the color as needed
//           ),
//         ),
//         subtitle: Text(
//           value,
//           style: TextStyle(
//             color: Colors.black87, // Adjust the color as needed
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildUserInfoCard(String title, Map<String, dynamic> userData) {
//     return Card(
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
//               'اسم المستخدم: ${userData['user_username']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               'البريد الإلكتروني: ${userData['user_email']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildJobInfoCard(String title, Map<String, dynamic> jobData) {
//     return Card(
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
//               'اسم الوظيفة: ${jobData['jop_name']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               'ملاحظات الوظيفة: ${jobData['jop_note']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDepartmentInfoCard(
//       String title, Map<String, dynamic> departmentData) {
//     return Card(
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
//               'اسم القسم: ${departmentData['depart_name']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               'مدير القسم: ${departmentData['depart_manger']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//             Text(
//               'ملاحظات القسم: ${departmentData['depart_note']}',
//               style: TextStyle(
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
