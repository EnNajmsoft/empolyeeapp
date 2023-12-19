import 'package:empolyeeapp/controller/hr/department/viewDepartController.dart';
import 'package:empolyeeapp/controller/hr/employee/employeeViewController.dart';
import 'package:empolyeeapp/controller/hr/user/userController.dart';
import 'package:empolyeeapp/core/utils/size_utils.dart';
import 'package:empolyeeapp/data/model/usermodel.dart';
import 'package:empolyeeapp/theme/app_decoration.dart';
import 'package:empolyeeapp/theme/app_style.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' المستخدمين المنتظرين'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<HRUserControllerImp>(
          init: HRUserControllerImp(), // قم بتهيئة الكنترولر هنا
          builder: (controller) => Expanded(
            child: ListView.builder(
              itemCount: controller.witUsers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.bottomSheet(vacationBottomsheet(
                        user: controller.witUsers[index]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _buildUserInfoCard(
                      ' بيانات الموظف ',
                      {
                        'employeeName': controller.witUsers[index].userUsername,
                        'employeeEmail': controller.witUsers[index].departName,
                        'employeePhone': controller.witUsers[index].jopName,
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

class vacationBottomsheet extends StatelessWidget {
  final HRUserControllerImp controller = Get.put(HRUserControllerImp());

  final UserModel user;

  vacationBottomsheet({required this.user});

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
            Padding(
                padding: getPadding(top: 26),
                child: Text("Cancel Booking",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRobotoRegular16)),
            Container(
                width: getHorizontalSize(340),
                margin: getMargin(left: 19, top: 26, right: 19),
                child: Text('',
                    // "${'19'.tr} $orderid",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtUrbanistRomanBold20)),
            Container(
                width: getHorizontalSize(372),
                margin: getMargin(left: 3, top: 8, right: 3),
                child: Text("${user.userUsername}",
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
                          // Get.to(() => TestChat(itemVacation: empvacation));
                          // Get.to(TestChat(itemvacation: empvacation) );
                          // controller.getempvacationtOne(empvacation.empidVacation);
                        }))
              ]),
            ),
            Padding(
                padding: getPadding(top: 12, bottom: 28),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child:CustomButton(
                            height: getVerticalSize(58),
                            text: "رفض",
                            margin: getMargin(right: 6),
                            variant: ButtonVariant.FillGray800,
                            onTap: () {
                              controller.rejectuser(user.userId);
                              Get.back();
                            }),
                  ),
                  Expanded(
                    child:  CustomButton(
                            height: getVerticalSize(58),
                            text: "قبول",
                            margin: getMargin(left: 6),
                            variant: ButtonVariant.OutlineGreenA7003f,
                            onTap: () {
                              controller.approvaluser(user.userId);
                              Get.back();
                            }),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
