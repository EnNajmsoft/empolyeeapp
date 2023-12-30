import 'package:flutter/material.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';

class OneVacationScreen extends StatelessWidget {
  final EmpVacationModel itemVacation;

  OneVacationScreen({required this.itemVacation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الإجازة'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
           const Divider(),
            Text(
              value1,
              style: const TextStyle(
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
