import 'package:empolyeeapp/controller/hr/vacationeType/VacTepyController.dart';
import 'package:empolyeeapp/core/utils/size_utils.dart';
import 'package:empolyeeapp/data/model/vacationtype.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:empolyeeapp/theme/app_decoration.dart';
import 'package:empolyeeapp/theme/app_style.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
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
          Get.offNamed(AppRoutes.addvacationtTypescreen);
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
                 return InkWell(
                      onTap: () {
                        Get.bottomSheet(vacationBottomsheet(
                            vacationType: controller.vacationTypes[index]));
                      },
                      child:  _buildUserInfoCard(' انواع الاجازات ', {
                'vacation_name': controller.vacationTypes[index].vacationTypeName,
                'vacation_note': controller.vacationTypes[index].vacationTypeNote,
              }),
                    );
              
           
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



class vacationBottomsheet extends StatelessWidget {
  final VeiwVacTepycontrollerImp controller = Get.put(VeiwVacTepycontrollerImp());

  final VacationTypeModel vacationType;

  vacationBottomsheet({required this.vacationType});

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
                child: Text("${vacationType.vacationTypeName}",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtUrbanistRegular14WhiteA700
                        .copyWith(letterSpacing: getHorizontalSize(0.2)))),
            Padding(
              padding: getPadding(top: 22, bottom: 8),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // Expanded(
                //   child: CustomButton(
                //       height: getVerticalSize(58),
                //       text: "ضفه",
                //       margin: getMargin(left: 6),
                //       variant: ButtonVariant.OutlineGreenA7003f,
                //       onTap: () {
                //         controller.gotoEmployeeDepart(department.departId);
                //       }),
                // ),
                Expanded(
                    child: CustomButton(
                        height: getVerticalSize(58),
                        text: "تعديل",
                        margin: getMargin(left: 6),
                        variant: ButtonVariant.OutlineGreenA7003f,
                        onTap: () {
                          controller.goToEditVacatype(vacationType);
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