import 'package:empolyeeapp/controller/admin/vacationDeparController.dart';
import 'package:empolyeeapp/controller/empolyee/vacation/viewcontrooler.dart';
import 'package:empolyeeapp/screen/admin/oneVacationScreen.dart';
import 'package:empolyeeapp/testchatgpt.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/core/app_export.dart';
import 'package:empolyeeapp/core/functions/alertexitapp.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class Emphome extends StatelessWidget {
  final EmpusercontrollerImp controller = Get.put(EmpusercontrollerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Vacations"),
        centerTitle: true,
        backgroundColor: Colors.blue, // تخصيص لون الخلفية
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addvacationempolyee);
        },
        child: const Icon(Icons.add),
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
                  Get.toNamed(AppRoutes.viewwituser);
                },
              ),
              ListTile(
            title: Text("jop"),
            leading: Icon(Icons.local_fire_department),
            onTap: () {
              Get.toNamed(AppRoutes.jopview);
            },
          ),
          ListTile(
            title: Text("الاعدادات"),
            leading: Icon(Icons.settings),
            onTap: () {
              Get.toNamed(AppRoutes.settings);
            },
          ),
              // Add more ListTile items as needed
            ], 
        ),
      ),
    ),
      body: GetBuilder<EmpusercontrollerImp>(
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
                          border: const OutlineInputBorder(
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
                    PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.tune,
                      ),
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
                SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.empVacations.length,
                    separatorBuilder: (context, index) => SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                      String? startDateString =
                          controller.empVacations[index].vacationStart;
                      String? endDateString =
                          controller.empVacations[index].vacationEnd;

                      DateTime? startDate = startDateString != null
                          ? DateTime.tryParse(startDateString)
                          : null;
                      DateTime? endDate = endDateString != null
                          ? DateTime.tryParse(endDateString)
                          : null;

                      String formattedStartDate =
                          startDate != null ? dateFormat.format(startDate) : '';
                      String formattedEndDate =
                          endDate != null ? dateFormat.format(endDate) : '';

                      return VacationCardEmpoolyee(
                        empVacation: controller.empVacations[index],
                        formattedStartDate: formattedStartDate,
                        formattedEndDate: formattedEndDate,
                      );
                      // return Card(
                      //   elevation: 2,
                      //   child: InkWell(
                      //     onTap: () {
                      //       Get.bottomSheet(vacationBottomsheet(
                      //           empvacation: controller.empVacations[index]));
                      //     },
                      //     child: Column(
                      //       children: [
                      //         ListTile(
                      //           title: Text(
                      //             '${controller.empVacations[index].userUsername}',
                      //             style: TextStyle(
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Colors.blue), // تخصيص لون النص
                      //           ),
                      //           subtitle: Text(
                      //             '${controller.empVacations[index].vacationTypeName}',
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 color:
                      //                     Colors.grey[600]), // تخصيص لون النص
                      //           ),
                      //           trailing: Icon(Icons.arrow_forward),
                      //         ),
                      //         Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                   "From: ${controller.empVacations[index].vacationStart}",
                      //                   style: TextStyle(
                      //                       color: Colors
                      //                           .grey[700])), // تخصيص لون النص
                      //               Text(
                      //                   "To: ${controller.empVacations[index].vacationEnd}",
                      //                   style: TextStyle(
                      //                       color: Colors
                      //                           .grey[700])), // تخصيص لون النص
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // );
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
  final EmpusercontrollerImp controller = Get.put(EmpusercontrollerImp());

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
                      Get.to(
                          () => OneVacationScreen(itemVacation: empvacation));
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class VacationCardEmpoolyee extends StatelessWidget {
  const VacationCardEmpoolyee({
    super.key,
    required this.formattedStartDate,
    required this.formattedEndDate,
    required this.empVacation,
  });
  final EmpVacationModel empVacation;
  final String formattedStartDate;
  final String formattedEndDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(23.0), // تعديل قيمة الانحناء حسب الرغبة
      ), // BorderRadius.all(Radius.circular(90)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Get.bottomSheet(vacationBottomsheet(empvacation: empVacation));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.0),
            // gradient: LinearGradient(
            //   colors: [
            //     Color.fromARGB(255, 187, 255, 254),
            //     Color.fromARGB(255, 39, 78, 255)
            //   ],
            //   stops: [0, 1],
            //   begin: AlignmentDirectional(0.03, -1),
            //   end: AlignmentDirectional(-0.93, 1.5),
            // ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'طلب رقم : ${empVacation.empVacationId}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            Jiffy(empVacation.vacationCreate, "yyyy-MM-dd")
                                .fromNow(),
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(
                            ' ${empVacation.vacationTypeName}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 6, 5, 5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "From: ${formattedStartDate}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Text(
                        "To: ${formattedEndDate}",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  // trailing: Text(
                  //   Jiffy(empVacation.vacationCreate, "yyyy-MM-dd").fromNow(),
                  //   style: TextStyle(color: Colors.grey[700]),
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "المدير",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        empVacation.vacationStateAdmin == '0'
                            ? Text(
                                " في الانتظار ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 250, 232, 27)),
                              )
                            : empVacation.vacationStateAdmin == '1'
                                ? Text(
                                    " تمت الموافقه ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 6, 216, 37)),
                                  )
                                : Text(
                                    " تم الرفض",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 226, 17, 17)),
                                  ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          " الموارد البشرية",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        empVacation.vacationStateHr == '0'
                            ? Text(
                                " في الانتظار ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 250, 232, 27)),
                              )
                            : empVacation.vacationStateHr == '1'
                                ? Text(
                                    " تمت الموافقه ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 6, 216, 37)),
                                  )
                                : Text(
                                    " تم الرفض",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 226, 17, 17)),
                                  ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:empolyeeapp/controller/empolyee/vacation/viewcontrooler.dart';
// import 'package:empolyeeapp/core/app_export.dart';
// import 'package:empolyeeapp/core/functions/alertexitapp.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // ignore: must_be_immutable
// class Emphome extends StatelessWidget {
//   EmpusercontrollerImp controller = Get.put(EmpusercontrollerImp());

//   Emphome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: [
//               const Text("empolyee vacations"),
//                 Text("${controller.username}"),
//             ],
//           ),

//           backgroundColor: ColorConstant.gray900,
//         ),
//         drawer:Drawer(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
//             child: Column(
//               children: const [
//                 ListTile(title: Text("الاجازت لرسميه"), leading: Icon(Icons.home),),
//               ],
//             ),
//           ),

//         ),

//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Get.toNamed(AppRoutes.addvacationempolyee);
//           },
//           child: const Icon(Icons.add),
//         ),
//         body: Column(
//           children: [
//               CustomButton(
//               height: 50,
//               text: "طلب الاجازة",
//               onTap: () {
//                 controller.changstatvac();
//               },
//             ),
//             Expanded(
//               child: GetBuilder<EmpusercontrollerImp>(
//                 builder: (controller) => WillPopScope(
//                   onWillPop: alertExitApp,
//                   child: Padding(
//                     padding: getPadding(top: 22, right: 14, left: 14),
//                     child: ListView.builder(
//                         itemCount: controller.empvact.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [

//                           InkWell(
//                             onTap: () {},
//                             child: Card(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                           flex: 8,
//                                           child: ListTile(
//                                             onTap: () {},
//                                             title: Text(
//                                                 "${controller.empvact[index].vacationTypeName}"),
//                                             subtitle: Text(
//                                                 "${controller.empvact[index].vacationCreate}"),
//                                             trailing: Expanded(
//                                               flex: 2,
//                                               child: Row(
//                                                 mainAxisSize:
//                                                     MainAxisSize.min,
//                                                 children: [
//                                                   Column(
//                                                     children: [
//                                                       const Text('Hr'),
//                                                       Text(
//                                                           "${controller.empvact[index].vacationStateHr}"),
//                                                     ],
//                                                   ),
//                                                   const SizedBox(width: 5),
//                                                   Column(
//                                                     children: [
//                                                       const Text('admin'),
//                                                       Text(
//                                                           "${controller.empvact[index].vacationStateAdmin}"),
//                                                     ],
//                                                   ),

//                                                 ],
//                                               ),
//                                             ),
//                                           )),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                             ],
//                           );
//                         }),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
