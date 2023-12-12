   
import 'package:empolyeeapp/controller/admin/vacationDeparController.dart';
import 'package:empolyeeapp/testchatgpt.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/core/app_export.dart';
import 'package:empolyeeapp/core/functions/alertexitapp.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';

class EmpVacationDepView extends StatelessWidget {
  final AdminVacationControllerImp controller = Get.put(AdminVacationControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("admin Vacations"),
        centerTitle: true,
        backgroundColor: Colors.blue, // تخصيص لون الخلفية
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              controller.filterData(value);
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: '0',
                child: Text('Pending'),
              ),
              PopupMenuItem<String>(
                value: '1',
                child: Text('Approved'),
              ),
              PopupMenuItem<String>(
                value: '2',
                child: Text('Rejected'),
              ),
              PopupMenuItem<String>(
                value: 'all',
                child: Text('All'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
          child: Column(
            children: [
              ListTile(
                title: Text("Official Vacations"),
                leading: Icon(Icons.home),
                onTap: () {
                  // Handle navigation or action
                },
              ),
              ListTile(
                title: Text("الاجازات "),
                leading: Icon(Icons.local_fire_department),
                onTap: () {
                 Get.toNamed(AppRoutes.vacationtpyeview);
                },
              ),
               ListTile(
                title: Text("الاقسام "),
                leading: Icon(Icons.local_fire_department),
                onTap: () {
                  Get.toNamed(AppRoutes.departementview);
                },
              ),
              ListTile(
                title: Text("المستخدمين"),
                leading: Icon(Icons.local_fire_department),
                onTap: () {
                  Get.toNamed(AppRoutes.departementview);
                },
              ),
              // Add more ListTile items as needed
            ],
          ),
        ),
      ),
        
      body: GetBuilder<AdminVacationControllerImp>(
        builder: (controller) => WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search vacations...',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue), // تخصيص لون الحدود
                          ),
                          filled: true,
                          fillColor:
                              Colors.grey[200], // تخصيص لون خلفية حقل البحث
                        ),
                        onChanged: (value) {
                          // Update the list when the search value changes
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {
                        // Open the filter interface here
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.empVacations.length,
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: InkWell(
                          onTap: () {
                            Get.bottomSheet(vacationBottomsheet(
                                empvacation: controller.empVacations[index]));
                          },
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  '${controller.empVacations[index].userUsername}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue), // تخصيص لون النص
                                ),
                                subtitle: Text(
                                  '${controller.empVacations[index].vacationTypeName}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          Colors.grey[600]), // تخصيص لون النص
                                ),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "From: ${controller.empVacations[index].vacationStart}",
                                        style: TextStyle(
                                            color: Colors
                                                .grey[700])), // تخصيص لون النص
                                    Text(
                                        "To: ${controller.empVacations[index].vacationEnd}",
                                        style: TextStyle(
                                            color: Colors
                                                .grey[700])), // تخصيص لون النص
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class vacationBottomsheet extends StatelessWidget {
  final AdminVacationControllerImp controller = Get.put(AdminVacationControllerImp());

  final EmpVacationModel empvacation;

  vacationBottomsheet({required this.empvacation});

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
            CustomImageView(
                svgPath: ImageConstant.imgFrameGray700,
                height: getVerticalSize(3),
                width: getHorizontalSize(38)),
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
                child: Text("${empvacation.userEmail}",
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
                          Get.to(() => TestChat(itemVacation: empvacation));
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

                        child: empvacation.vacationStateAdmin == "2"
                        ? Text("مرفض")
                        : CustomButton(
                        height: getVerticalSize(58),
                        text: "رفض",
                        margin: getMargin(right: 6),
                        variant: ButtonVariant.FillGray800,
                        onTap: () {
                          controller.rejectvac(empvacation.empVacationId);
                           Get.back();
                                             }),
                  ),
                  Expanded(
                  
                       child: empvacation.vacationStateAdmin == "1"
                          ? Text("مقبول")
                          :  CustomButton(
                          height: getVerticalSize(58),
                          text: "قبول",
                          margin: getMargin(left: 6),
                          variant: ButtonVariant.OutlineGreenA7003f,
                          onTap: () {
                            controller.approvalvac(empvacation.empVacationId);
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