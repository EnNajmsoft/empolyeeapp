import 'package:empolyeeapp/controller/hr/department/viewDepartController.dart';
import 'package:empolyeeapp/core/utils/size_utils.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:empolyeeapp/theme/app_decoration.dart';
import 'package:empolyeeapp/theme/app_style.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:empolyeeapp/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartementView extends StatelessWidget {
  final VeiwDepartcontrollerImp controller = Get.put(VeiwDepartcontrollerImp());

  DepartementView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' الاقسام'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(AppRoutes.addepartscreen);
        },
        child: const Icon(Icons.add_card),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: GetBuilder<VeiwDepartcontrollerImp>(
            builder: (controller) => Padding(
              padding: getPadding(top: 22, right: 14, left: 14),
              child: ListView.builder(
                  itemCount: controller.departements.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.bottomSheet(vacationBottomsheet(
                            department: controller.departements[index]));
                      },
                      child: _buildUserInfoCard('بيانات القسم', {
                        'depart_name':
                            controller.departements[index].departName,
                        'depart_manger':
                            controller.departements[index].userUsername,
                        'depart_note':
                            controller.departements[index].departNote,
                      }),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class vacationBottomsheet extends StatelessWidget {
  final VeiwDepartcontrollerImp controller = Get.put(VeiwDepartcontrollerImp());

  final DepartementModel department;

  vacationBottomsheet({required this.department});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: AppDecoration.outlineGray8002
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: getHorizontalSize(372),
                margin: getMargin(left: 3, top: 8, right: 3),
                child: Text("${department.departName}",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtUrbanistRegular14WhiteA700
                        .copyWith(letterSpacing: getHorizontalSize(0.2)))),
            Padding(
              padding: getPadding(top: 22, bottom: 8),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                  child: CustomButton(
                      height: getVerticalSize(58),
                      text: "عرض",
                      margin: getMargin(left: 6),
                      variant: ButtonVariant.OutlineGreenA7003f,
                      onTap: () {
                        controller.gotoEmployeeDepart(department.departId);
                      }),
                ),
                Expanded(
                    child: CustomButton(
                        height: getVerticalSize(58),
                        text: "تعديل",
                        margin: getMargin(left: 6),
                        variant: ButtonVariant.OutlineGreenA7003f,
                        onTap: () {
                          controller.goToEditDepart(department);
                        }),),
              ]),
            ),
            Padding(
                padding: getPadding(top: 12, bottom: 28),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // Expanded(
                  //   child: empvacation.vacationStateHr == "2"
                  //       ? Text("مرفض")
                  //       : CustomButton(
                  //           height: getVerticalSize(58),
                  //           text: "رفض",
                  //           margin: getMargin(right: 6),
                  //           variant: ButtonVariant.FillGray800,
                  //           onTap: () {
                  //             controller.rejectvac(empvacation.empVacationId);
                  //             Get.back();
                  //           }),
                  // ),
                  // Expanded(
                  //   child: empvacation.vacationStateHr == "1"
                  //       ? Text("مقبول")
                  //       : CustomButton(
                  //           height: getVerticalSize(58),
                  //           text: "قبول",
                  //           margin: getMargin(left: 6),
                  //           variant: ButtonVariant.OutlineGreenA7003f,
                  //           onTap: () {
                  //             controller.approvalvac(empvacation.empVacationId);
                  //             Get.back();
                  //           }),
                  // )
                ]))
          ],
        ),
      ),
    );
  }
}

Widget _buildUserInfoCard(String title, Map<String, dynamic> departData) {
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
            'اسم القسم: ${departData['depart_name']}',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          Text(
            'ملاحظة : ${departData['depart_manger']}',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          Text(
            'ملاحظة : ${departData['depart_note']}',
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