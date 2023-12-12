// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:empolyeeapp/data/model/empvacation.dart';

// class TestChat extends StatelessWidget {
//   final EmpVacation itemvacation;

//   TestChat({required this.itemvacation});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تفاصيل الإجازة'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: ListView(
//           children: ListTile.divideTiles(
//             context: context,
//             tiles: [
//               _buildInfoCard(
//                 'تاريخ بداية الإجازة',
//                 DateFormat('yyyy-MM-dd').format(itemvacation.empVacationStart),
//               ),
//               _buildInfoCard(
//                 'تاريخ نهاية الإجازة',
//                 DateFormat('yyyy-MM-dd').format(itemvacation.empVacationEnd),
//               ),
//               _buildInfoCard('نوع الإجازة', itemvacation.vacationName),
//               _buildInfoCard(
//                 'حالة الإجازة',
//                 itemvacation.empVacationStateHr == '0'
//                     ? 'قيد المراجعة'
//                     : 'تمت الموافقة',
//               ),
//               _buildInfoCard('ملاحظات', itemvacation.empVacationNote),
//               _buildInfoCard('ملف الإجازة', itemvacation.empVacationFile),
//               _buildInfoCard(
//                 'تاريخ الإنشاء',
//                 DateFormat('yyyy-MM-dd').format(itemvacation.empVacationCreate),
//               ),
//               _buildUserInfoCard('بيانات الموظف', {
//                 'user_username': itemvacation.userUsername,
//                 'user_email': itemvacation.userUsername,
//               }),
//               _buildJobInfoCard('بيانات الوظيفة', {
//                 'jop_name': itemvacation.jopName,
//                 'jop_note': itemvacation.jopNote,
//               }),
//               _buildDepartmentInfoCard('بيانات القسم', {
//                 'depart_name': itemvacation.departName,
//                 'depart_manger': itemvacation.departManger,
//                 'depart_note': itemvacation.departNote,
//               }),
//             ],
//           ).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard(String title, value) {
//     return Card(
//       child: ListTile(
//         title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(value != null ? value.toString() : ''),
//       ),
//     );
//   }

//   Widget _buildUserInfoCard(String title, Map<String, dynamic> userData) {
//     return Card(
//       child: ListTile(
//         title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('اسم المستخدم: ${userData['user_username']}'),
//             Text('البريد الإلكتروني: ${userData['user_email']}'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildJobInfoCard(String title, Map<String, dynamic> jobData) {
//     return Card(
//       child: ListTile(
//         title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('اسم الوظيفة: ${jobData['jop_name']}'),
//             Text('ملاحظات الوظيفة: ${jobData['jop_note']}'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDepartmentInfoCard(
//       String title, Map<String, dynamic> departmentData) {
//     return Card(
//       child: ListTile(
//         title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('اسم القسم: ${departmentData['depart_name']}'),
//             Text('مدير القسم: ${departmentData['depart_manger']}'),
//             Text('ملاحظات القسم: ${departmentData['depart_note']}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:flutter/material.dart';

class TestChat extends StatelessWidget {
  final EmpVacationModel itemVacation;

  TestChat({required this.itemVacation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل الإجازة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInfoCard(
                'تاريخ بداية الإجازة', itemVacation.vacationStart),
            _buildInfoCard('تاريخ نهاية الإجازة', itemVacation.vacationEnd),
            _buildInfoCard('نوع الإجازة', itemVacation.vacationTypeName),
            _buildInfoCard(
              'حالة الإجازة',
              itemVacation.vacationStateHr == '0'
                  ? 'قيد المراجعة'
                  : 'تمت الموافقة',
            ),
            _buildInfoCard('ملاحظات', itemVacation.vacationNote),
            _buildInfoCard('ملف الإجازة', itemVacation.vacationFile),
            _buildInfoCard('تاريخ الإنشاء', itemVacation.vacationCreate),
            _buildUserInfoCard('بيانات الموظف', {
              'user_username': itemVacation.userUsername,
              'user_email': itemVacation.userUsername,
            }),
            _buildJobInfoCard('بيانات الوظيفة', {
              'jop_name': itemVacation.jopName,
              'jop_note': itemVacation.jopNote,
            }),
            _buildDepartmentInfoCard('بيانات القسم', {
              'depart_name': itemVacation.departName,
              'depart_manger': itemVacation.departManger,
              'depart_note': itemVacation.departNote,
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, value) {
    return Card(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Adjust the color as needed
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            color: Colors.black87, // Adjust the color as needed
          ),
        ),
      ),
    );
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
              'اسم المستخدم: ${userData['user_username']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              'البريد الإلكتروني: ${userData['user_email']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobInfoCard(String title, Map<String, dynamic> jobData) {
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
              'اسم الوظيفة: ${jobData['jop_name']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              'ملاحظات الوظيفة: ${jobData['jop_note']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentInfoCard(
      String title, Map<String, dynamic> departmentData) {
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
              'اسم القسم: ${departmentData['depart_name']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              'مدير القسم: ${departmentData['depart_manger']}',
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            Text(
              'ملاحظات القسم: ${departmentData['depart_note']}',
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
