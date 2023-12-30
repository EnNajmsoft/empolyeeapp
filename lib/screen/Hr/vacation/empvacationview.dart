import 'package:empolyeeapp/core/class/handlingdataview.dart';
import 'package:empolyeeapp/screen/admin/oneVacationScreen.dart';
import 'package:empolyeeapp/testchatgpt.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/core/app_export.dart';
import 'package:empolyeeapp/core/functions/alertexitapp.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:empolyeeapp/controller/hr/vacations/empvacatcontroller.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class EmpVacationView extends StatelessWidget {
  final EmpvacatcontrollerImp controller = Get.put(EmpvacatcontrollerImp());
  List<String> notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    // ... يمكنك إضافة المزيد من الإشعارات حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray900,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomAppBar(),
      ),
      drawer: const CustomDrawer(),
      //  body: Stack(
      //   children: [
      //     Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(
      //       sigmaX: 5,
      //       sigmaY: 5
      //     ))),
      //      Center(
      //        child: Lottie.asset(AppImageAsset.offline,
      //                 width: 250, height: 250),
      //      ),
      body: GetBuilder<EmpvacatcontrollerImp>(
        builder: (controller) => WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          filled: true,
                          fillColor: ColorConstant.gray8002d,
                        ),
                        onChanged: (value) {
                          // Update the list when the search value changes
                        },
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.tune,
                        color: ColorConstant.whiteA700,
                      ),
                      onSelected: (value) {
                        controller.filterData(value);
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem<String>(
                          value: '0',
                          child: Text('Pending'),
                        ),
                        const PopupMenuItem<String>(
                          value: '1',
                          child: Text('Approved'),
                        ),
                        const PopupMenuItem<String>(
                          value: '2',
                          child: Text('Rejected'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'all',
                          child: Text('All'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                    //              body: Container(
                    //   padding:const  EdgeInsets.all(10),
                    //   child: GetBuilder<OrdersPendingController>(
                    //       builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                    //             itemCount: controller.data.length,
                    //             itemBuilder: ((context, index) =>
                    //                 CardOrdersList(listdata: controller.data[index])),
                    //           )))),
                    // )
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(5, 18, 5, 0),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(248, 244, 241, 248),
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20), bottom: Radius.zero)),
                  child: GetBuilder<EmpvacatcontrollerImp>(
                    builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                        itemCount: controller.empVacations.length,
                        itemBuilder: ((context, index) {
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

                          String formattedStartDate = startDate != null
                              ? dateFormat.format(startDate)
                              : '';
                          String formattedEndDate =
                              endDate != null ? dateFormat.format(endDate) : '';
                        return  VacationCard(
                            formattedStartDate: formattedStartDate,
                            formattedEndDate: formattedEndDate,
                            empVacation: controller.empVacations[index],
                          );
                        }),
                      ),

                      // ListView.separated(
                      //   itemCount: controller.empVacations.length,
                      //   separatorBuilder: (context, index) => SizedBox(height: 8),
                      //   itemBuilder: (context, index) {

                      //     DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                      //     String? startDateString =
                      //         controller.empVacations[index].vacationStart;
                      //     String? endDateString =
                      //         controller.empVacations[index].vacationEnd;

                      //     DateTime? startDate = startDateString != null
                      //         ? DateTime.tryParse(startDateString)
                      //         : null;
                      //     DateTime? endDate = endDateString != null
                      //         ? DateTime.tryParse(endDateString)
                      //         : null;

                      //     String formattedStartDate = startDate != null
                      //         ? dateFormat.format(startDate)
                      //         : '';
                      //     String formattedEndDate =
                      //         endDate != null ? dateFormat.format(endDate) : '';

                      //     return VacationCard(
                      //       formattedStartDate: formattedStartDate,
                      //       formattedEndDate: formattedEndDate,
                      //       empVacation: controller.empVacations[index],
                      //     );
                      //   },
                      // ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VacationCard extends StatelessWidget {
  const VacationCard({
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
// Generated code for this transaction Widget...
    return InkWell(
      onTap: () {
        Get.bottomSheet(VacationBottomSheet(empvacation: empVacation));
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
        child: Container(
          // width: MediaQuery.sizeOf(context).width * 0.92,

          height: 200,

          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x35000000),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFF1F4F8),
              width: 1,
            ),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 14, 4, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0x4C4B39EF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.person_4_sharp,
                            color: Color(0xFF4B39EF),
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${empVacation.userUsername}',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF14181B),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                '${empVacation.departName}',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            Jiffy(empVacation.departCreate, "yyyy-MM-dd")
                                .fromNow(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF14181B),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'vacation type',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Text(
                              '${empVacation.vacationTypeName}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF14181B),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'from',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF14181B),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              formattedStartDate,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'to',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF14181B),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              formattedEndDate,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFF57636C),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 280,
                child: Divider(
                  thickness: 1,
                  color: Color(0xFF421BC9),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "المدير",
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF14181B),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: empVacation.vacationStateAdmin == '0'
                                  ? const Text(
                                      " في الانتظار ",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 232, 27)),
                                    )
                                  : empVacation.vacationStateAdmin == '1'
                                      ? const Text(
                                          " تمت الموافقه ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 6, 216, 37)),
                                        )
                                      : const Text(
                                          " تم الرفض",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 226, 17, 17)),
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            " الموارد البشرية",
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF14181B),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Color(0xFFF9F300),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: empVacation.vacationStateHr == '0'
                                  ? const Text(
                                      " في الانتظار ",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 232, 27)),
                                    )
                                  : empVacation.vacationStateHr == '1'
                                      ? const Text(
                                          " تمت الموافقه ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 6, 216, 37)),
                                        )
                                      : const Text(
                                          " تم الرفض",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 226, 17, 17)),
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Card(

    //   shape: RoundedRectangleBorder(
    //     borderRadius:
    //         BorderRadius.circular(23.0), // تعديل قيمة الانحناء حسب الرغبة
    //   ), // BorderRadius.all(Radius.circular(90)),
    //   elevation: 2,
    //   child: InkWell(
    //     onTap: () {
    //       Get.bottomSheet(VacationBottomSheet(empvacation: empVacation));
    //     },
    //     child: Container(

    //       decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(23.0),
    //         // gradient: LinearGradient(
    //         //   colors: [
    //         //     Color.fromARGB(255, 187, 255, 254),
    //         //     Color.fromARGB(255, 39, 78, 255)
    //         //   ],
    //         //   stops: [0, 1],
    //         //   begin: AlignmentDirectional(0.03, -1),
    //         //   end: AlignmentDirectional(-0.93, 1.5),
    //         // ),
    //       ),
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: ListTile(
    //               title: Row(
    //                 children: [
    //                   Icon(
    //                     Icons.person_4,
    //                     size: 40,
    //                   ),
    //                   Column(children: [
    //                     Text(
    //                       '${empVacation.userUsername}',
    //                       style: TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.blue,
    //                       ),
    //                     ),
    //                     Text(
    //                       '${empVacation.jopName}/${empVacation.departName}',
    //                       style: TextStyle(
    //                         fontSize: 16,
    //                         color: Colors.grey[600],
    //                       ),
    //                     ),
    //                   ]),
    //                 ],
    //               ),
    //               subtitle: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     "From: ${formattedStartDate}",
    //                     style: TextStyle(color: Colors.grey[700]),
    //                   ),
    //                   Text(
    //                     "To: ${formattedEndDate}",
    //                     style: TextStyle(color: Colors.grey[700]),
    //                   ),
    //                 ],
    //               ),
    //               trailing:   Text(
    //                 Jiffy(empVacation.departCreate, "yyyy-MM-dd").fromNow(),

    //                 style: TextStyle(color: Colors.grey[700]),
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Column(
    //                   children: [
    //                     Text(
    //                       "المدير",
    //                       style: TextStyle(color: Colors.grey[700]),
    //                     ),
    //                     empVacation.vacationStateAdmin == '0'
    //                         ? Text(
    //                             " في الانتظار ",
    //                             style: TextStyle(
    //                                 color: Color.fromARGB(255, 250, 232, 27)),
    //                           )
    //                         : empVacation.vacationStateAdmin == '1'
    //                             ? Text(
    //                                 " تمت الموافقه ",
    //                                 style: TextStyle(
    //                                     color: Color.fromARGB(255, 6, 216, 37)),
    //                               )
    //                             : Text(
    //                                 " تم الرفض",
    //                                 style: TextStyle(
    //                                     color: Color.fromARGB(255, 226, 17, 17)),
    //                               ),
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     Text(
    //                       " الموارد البشرية",
    //                       style: TextStyle(color: Colors.grey[700]),
    //                     ),
    //                     empVacation.vacationStateHr == '0'
    //                         ? Text(
    //                             " في الانتظار ",
    //                             style: TextStyle(
    //                                 color: Color.fromARGB(255, 250, 232, 27)),
    //                           )
    //                         : empVacation.vacationStateHr == '1'
    //                             ? Text(
    //                                 " تمت الموافقه ",
    //                                 style: TextStyle(
    //                                     color: Color.fromARGB(255, 6, 216, 37)),
    //                               )
    //                             : Text(
    //                                 " تم الرفض",
    //                                 style: TextStyle(
    //                                     color: Color.fromARGB(255, 226, 17, 17)),
    //                               ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

class VacationBottomSheet extends StatelessWidget {
  final EmpvacatcontrollerImp controller = Get.put(EmpvacatcontrollerImp());
  final EmpVacationModel empvacation;

  VacationBottomSheet({required this.empvacation});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: AppDecoration.outlineGray8002
            .copyWith(borderRadius: BorderRadiusStyle.customBorderBL36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // CustomImageView(
            //   svgPath: ImageConstant.imgFrameGray700,
            //   height: getVerticalSize(3),
            //   width: getHorizontalSize(38),
            // ),
            Padding(
              padding: getPadding(top: 26),
              child: Text(
                "Cancel Booking",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtRobotoRegular16,
              ),
            ),
            Container(
              width: getHorizontalSize(340),
              margin: getMargin(left: 19, top: 26, right: 19),
              child: Text(
                '',
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtUrbanistRomanBold20,
              ),
            ),
            Container(
              width: getHorizontalSize(372),
              margin: getMargin(left: 3, top: 8, right: 3),
              child: Text(
                "${empvacation.userEmail}",
                maxLines: null,
                textAlign: TextAlign.center,
                style: AppStyle.txtUrbanistRegular14WhiteA700
                    .copyWith(letterSpacing: getHorizontalSize(0.2)),
              ),
            ),
            Padding(
              padding: getPadding(top: 22, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
            ),
            Padding(
              padding: getPadding(top: 12, bottom: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: empvacation.vacationStateHr == "2"
                        ? CustomButton(
                            height: getVerticalSize(58),
                            text: "مرفوض",
                            margin: getMargin(right: 6),
                            variant: ButtonVariant.FillGray800,
                            onTap: () {},
                          )
                        // Text("مرفوض")
                        : CustomButton(
                            height: getVerticalSize(58),
                            text: "رفض",
                            margin: getMargin(right: 6),
                            variant: ButtonVariant.FillGray800,
                            onTap: () {
                              controller.rejectvac(empvacation.empVacationId);
                              Get.back();
                            },
                          ),
                  ),
                  Expanded(
                    child: empvacation.vacationStateHr == "1"
                        ? CustomButton(
                            height: getVerticalSize(58),
                            text: "مقبول",
                            margin: getMargin(right: 6),
                            variant: ButtonVariant.FillGray800,
                            onTap: () {},
                          )
                        : CustomButton(
                            height: getVerticalSize(58),
                            text: "قبول",
                            margin: getMargin(left: 6),
                            variant: ButtonVariant.OutlineGreenA7003f,
                            onTap: () {
                              controller.approvalvac(empvacation.empVacationId);
                              Get.back();
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.zero, bottom: Radius.circular(25)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.vertical(
            //     top: Radius.zero, bottom: Radius.circular(25)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 2, 8, 71),
                ColorConstant.gray900,
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(0.03, -1),
              end: AlignmentDirectional(-0.03, 1),
            ),
          ),
        ),
      ),
      title: Text("hr Vacations"),
      centerTitle: true,
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return
//         // return Scaffold(

//         //   appBar: AppBar(

//         //     leading: Padding(
//         //         padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
//         //         child: Container(
//         //           width: double.infinity,
//         //           height: 100,

//         //         ),
//         //       ),
//         //     title: Text("Hr Vacations"),
//         //     centerTitle: true,
//         //     backgroundColor: Colors.blue, // تخصيص لون الخلفية
//         //     actions: [
//         //       PopupMenuButton<String>(
//         //         onSelected: (value) {
//         //           controller.filterData(value);
//         //         },
//         //         itemBuilder: (BuildContext context) => [
//         //           PopupMenuItem<String>(
//         //             value: '0',
//         //             child: Text('Pending'),
//         //           ),
//         //           PopupMenuItem<String>(
//         //             value: '1',
//         //             child: Text('Approved'),
//         //           ),
//         //           PopupMenuItem<String>(
//         //             value: '2',
//         //             child: Text('Rejected'),
//         //           ),
//         //           PopupMenuItem<String>(
//         //             value: 'all',
//         //             child: Text('All'),
//         //           ),
//         //         ],
//         //       ),
//         //     ],
//         //   ),
//         //     drawer: Drawer(
//         //     child: Padding(
//         //       padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
//         //       child: Column(
//         //         children: [
//         //           ListTile(
//         //             title: Text("Official Vacations"),
//         //             leading: Icon(Icons.home),
//         //             onTap: () {
//         //               // Handle navigation or action
//         //             },
//         //           ),
//         //           ListTile(
//         //             title: Text("الاجازات "),
//         //             leading: Icon(Icons.local_fire_department),
//         //             onTap: () {
//         //               Get.toNamed(AppRoutes.vacationtpyeview);
//         //             },
//         //           ),
//         //           ListTile(
//         //             title: Text("الاقسام "),
//         //             leading: Icon(Icons.local_fire_department),
//         //             onTap: () {
//         //               Get.toNamed(AppRoutes.departementview);
//         //             },
//         //           ),
//         //           ListTile(
//         //             title: Text("المستخدمين"),
//         //             leading: Icon(Icons.local_fire_department),
//         //             onTap: () {
//         //               Get.toNamed(AppRoutes.departementview);
//         //             },
//         //           ),
//         //           // Add more ListTile items as needed
//         //         ],
//         //       ),
//         //     ),
//         //   ),
//         Scaffold(
//       appBar: AppBar(
//         title: Text("hr Vacations"),
//         centerTitle: true,
//         backgroundColor: Colors.blue, // تخصيص لون الخلفية
//         actions: [
//            PopupMenuButton<String>(
//             icon: Icon(Icons.notifications),
//             onSelected: (String notification) {
//               // تنفيذ العمليات المرتبطة بفتح الإشعار المحدد
//               print('Selected notification: $notification');
//             },
//             itemBuilder: (BuildContext context) {
//               return notifications.map((String notification) {
//                 return PopupMenuItem<String>(
//                   value: notification,
//                   child: Text(notification),
//                 );
//               }).toList();
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
//           child: Column(
//             children: [
//               ListTile(
//                 title: Text("Official Vacations"),
//                 leading: Icon(Icons.home),
//                 onTap: () {
//                   // Handle navigation or action
//                 },
//               ),
//               ListTile(
//                 title: Text("الاجازات "),
//                 leading: Icon(Icons.local_fire_department),
//                 onTap: () {
//                   Get.toNamed(AppRoutes.vacationtpyeview);
//                 },
//               ),
//               ListTile(
//                 title: Text("الاقسام "),
//                 leading: Icon(Icons.local_fire_department),
//                 onTap: () {
//                   Get.toNamed(AppRoutes.departementview);
//                 },
//               ),
//               ListTile(
//                 title: Text("المستخدمين"),
//                 leading: Icon(Icons.local_fire_department),
//                 onTap: () {
//                   Get.toNamed(AppRoutes.viewwituser);
//                 },
//               ),
//               ListTile(
//                 title: Text("jop"),
//                 leading: Icon(Icons.local_fire_department),
//                 onTap: () {
//                   Get.toNamed(AppRoutes.jopview);
//                 },
//               ),
//               // Add more ListTile items as needed
//             ],
//           ),
//         ),
//       ),
//       body: GetBuilder<EmpvacatcontrollerImp>(
//         builder: (controller) => WillPopScope(
//           onWillPop: alertExitApp,
//           child: Container(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Search vacations...',
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.blue), // تخصيص لون الحدود
//                           ),
//                           filled: true,
//                           fillColor:
//                               Colors.grey[200], // تخصيص لون خلفية حقل البحث
//                         ),
//                         onChanged: (value) {
//                           // Update the list when the search value changes
//                         },
//                       ),
//                     ),
//                     PopupMenuButton<String>(

//             icon: Icon(Icons.filter_1_outlined),

//                       onSelected: (value) {
//                         controller.filterData(value);
//                       },
//                       itemBuilder: (BuildContext context) => [
//                         PopupMenuItem<String>(
//                           value: '0',
//                           child: Text('Pending'),
//                         ),
//                         PopupMenuItem<String>(
//                           value: '1',
//                           child: Text('Approved'),
//                         ),
//                         PopupMenuItem<String>(
//                           value: '2',
//                           child: Text('Rejected'),
//                         ),
//                         PopupMenuItem<String>(
//                           value: 'all',
//                           child: Text('All'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Expanded(
//                   child: ListView.separated(
//                     itemCount: controller.empVacations.length,
//                     separatorBuilder: (context, index) => SizedBox(height: 8),
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 2,
//                         child: InkWell(
//                           onTap: () {
//                             Get.bottomSheet(vacationBottomsheet(
//                                 empvacation: controller.empVacations[index]));
//                           },
//                           child: Column(
//                             children: [
//                               ListTile(
//                                 title: Text(
//                                   '${controller.empVacations[index].userUsername}',
//                                   style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blue), // تخصيص لون النص
//                                 ),
//                                 subtitle: Text(
//                                   '${controller.empVacations[index].vacationTypeName}',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       color:
//                                           Colors.grey[600]), // تخصيص لون النص
//                                 ),
//                                 trailing: Icon(Icons.arrow_forward),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       // Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
//                                         "From: ${controller.empVacations[index].vacationStart}",
//                                         style: TextStyle(
//                                             color: Colors
//                                                 .grey[700])), // تخصيص لون النص
//                                     Text(
//                                         "To: ${controller.empVacations[index].vacationEnd}",
//                                         style: TextStyle(
//                                             color: Colors
//                                                 .grey[700])), // تخصيص لون النص
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class vacationBottomsheet extends StatelessWidget {
//   final EmpvacatcontrollerImp controller = Get.put(EmpvacatcontrollerImp());

//   final EmpVacationModel empvacation;

//   vacationBottomsheet({required this.empvacation});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: AppDecoration.outlineGray8002
//             .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//                 padding: getPadding(top: 26),
//                 child: Text("Cancel Booking",
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: AppStyle.txtRobotoRegular16)),
//             Container(
//                 width: getHorizontalSize(340),
//                 margin: getMargin(left: 19, top: 26, right: 19),
//                 child: Text('',
//                     // "${'19'.tr} $orderid",
//                     maxLines: null,
//                     textAlign: TextAlign.center,
//                     style: AppStyle.txtUrbanistRomanBold20)),
//             Container(
//                 width: getHorizontalSize(372),
//                 margin: getMargin(left: 3, top: 8, right: 3),
//                 child: Text("${empvacation.userEmail}",
//                     maxLines: null,
//                     textAlign: TextAlign.center,
//                     style: AppStyle.txtUrbanistRegular14WhiteA700
//                         .copyWith(letterSpacing: getHorizontalSize(0.2)))),
//             Padding(
//               padding: getPadding(top: 22, bottom: 8),
//               child:
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Expanded(
//                     child: CustomButton(
//                         height: getVerticalSize(58),
//                         text: "عرض",
//                         margin: getMargin(left: 6),
//                         variant: ButtonVariant.OutlineGreenA7003f,
//                         onTap: () {
//                           Get.to(() => OneVacationScreen(itemVacation: empvacation));
//                           // Get.to(TestChat(itemvacation: empvacation) );
//                           // controller.getempvacationtOne(empvacation.empidVacation);
//                         }))
//               ]),
//             ),
//             Padding(
//                 padding: getPadding(top: 12, bottom: 28),
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Expanded(
//                     child: empvacation.vacationStateHr == "2"
//                         ? Text("مرفض")
//                         : CustomButton(
//                             height: getVerticalSize(58),
//                             text: "رفض",
//                             margin: getMargin(right: 6),
//                             variant: ButtonVariant.FillGray800,
//                             onTap: () {
//                               controller.rejectvac(empvacation.empVacationId);
//                               Get.back();
//                             }),
//                   ),
//                   Expanded(
//                     child: empvacation.vacationStateHr == "1"
//                         ? Text("مقبول")
//                         : CustomButton(
//                             height: getVerticalSize(58),
//                             text: "قبول",
//                             margin: getMargin(left: 6),
//                             variant: ButtonVariant.OutlineGreenA7003f,
//                             onTap: () {
//                               controller.approvalvac(empvacation.empVacationId);
//                               Get.back();
//                             }),
//                   )
//                 ]))
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:empolyeeapp/controller/hr/empvacation/empvacatcontroller.dart';
// // import 'package:empolyeeapp/core/app_export.dart';
// // import 'package:empolyeeapp/core/functions/alertelogoteadmin.dart';
// // import 'package:empolyeeapp/core/functions/alertexitapp.dart';
// // import 'package:empolyeeapp/data/model/empvacation.dart';
// // import 'package:empolyeeapp/screen/admin/empvacation/itemvacation.dart';

// // class EmpVacationView extends StatelessWidget {
// //   final EmpvacatcontrollerImp controller = Get.put(EmpvacatcontrollerImp());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Employee Vacations"),
// //         centerTitle: true,
// //         backgroundColor: ColorConstant.gray900,
// //         actions: [
// //           PopupMenuButton<String>(
// //             onSelected: (value) {
// //               controller.filterData(value);
// //             },
// //             itemBuilder: (BuildContext context) => [
// //               PopupMenuItem<String>(
// //                 value: '0',
// //                 child: Text('Pending'),
// //               ),
// //               PopupMenuItem<String>(
// //                 value: '1',
// //                 child: Text('Approved'),
// //               ),
// //               PopupMenuItem<String>(
// //                 value: '2',
// //                 child: Text('Rejected'),
// //               ),
// //               PopupMenuItem<String>(
// //                 value: 'all',
// //                 child: Text('All'),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //       drawer: Drawer(
// //         child: Padding(
// //           padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
// //           child: Column(
// //             children: [
// //               ListTile(
// //                 title: Text("Official Vacations"),
// //                 leading: Icon(Icons.home),
// //                 onTap: () {
// //                   // Handle navigation or action
// //                 },
// //               ),
// //               // Add more ListTile items as needed
// //             ],
// //           ),
// //         ),
// //       ),
// //       body: GetBuilder<EmpvacatcontrollerImp>(
// //         builder: (controller) => WillPopScope(
// //           onWillPop: alertExitApp,
// //           child: Container(
// //             padding: EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: TextField(
// //                         decoration: InputDecoration(
// //                           hintText: 'Search vacations...',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         onChanged: (value) {
// //                           // Update the list when the search value changes
// //                         },
// //                       ),
// //                     ),
// //                     IconButton(
// //                       icon: Icon(Icons.filter_list),
// //                       onPressed: () {
// //                         // Open the filter interface here
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 16),
// //                 Expanded(
// //                   child: ListView.separated(
// //                     itemCount: controller.empVacations.length,
// //                     separatorBuilder: (context, index) => SizedBox(height: 8),
// //                     itemBuilder: (context, index) {
// //                       return Card(
// //                         elevation: 2,
// //                         child: InkWell(
// //                           onTap: () {
// //                             Get.bottomSheet(CancelBookingBottomsheet(
// //                                 empvacation: controller.empVacations[index]));
// //                           },
// //                           child: Column(
// //                             children: [
// //                               ListTile(
// //                                 title: Text(
// //                                   '${controller.empVacations[index].userUsername}',
// //                                   style: TextStyle(
// //                                       fontSize: 18,
// //                                       fontWeight: FontWeight.bold),
// //                                 ),
// //                                 subtitle: Text(
// //                                   '${controller.empVacations[index].vacationName}',

// //                                   style: TextStyle(fontSize: 16),
// //                                 ),
// //                                 trailing: Icon(Icons.arrow_forward),
// //                               ),
// //                               Padding(
// //                                 padding: const EdgeInsets.all(8.0),
// //                                 child: Row(
// //                                   mainAxisAlignment:
// //                                       MainAxisAlignment.spaceBetween,
// //                                   children: [
// //                                     Text(
// //                                         "From: ${controller.empVacations[index].empVacationStart}"),
// //                                     Text(
// //                                         "To: ${controller.empVacations[index].empVacationEnd}"),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class CancelBookingBottomsheet extends StatelessWidget {
// //   final EmpVacation empvacation;

// //   CancelBookingBottomsheet({required this.empvacation});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Container(
// //         padding: EdgeInsets.all(16),
// //         decoration: AppDecoration.outlineGray8002
// //             .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             // Your bottom sheet content here
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // 2
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:empolyeeapp/controller/hr/empvacation/empvacatcontroller.dart';
// // import 'package:empolyeeapp/core/app_export.dart';
// // import 'package:empolyeeapp/core/functions/alertelogoteadmin.dart';
// // import 'package:empolyeeapp/core/functions/alertexitapp.dart';
// // import 'package:empolyeeapp/data/model/empvacation.dart';
// // import 'package:empolyeeapp/screen/admin/empvacation/itemvacation.dart';

// // class EmpVacationView extends StatelessWidget {
// //   final EmpvacatcontrollerImp controller = Get.put(EmpvacatcontrollerImp());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Employee Vacations"),
// //         centerTitle: true,
// //         backgroundColor: ColorConstant.gray900,
// //         actions: [
// //           PopupMenuButton<String>(
// //             onSelected: (value) {
// //               controller.filterData(value);
// //             },
// //             itemBuilder: (BuildContext context) => [
// //               PopupMenuItem<String>(
// //                 value: '0',
// //                 child: Text('Pending'),
// //               ),
// //               PopupMenuItem<String>(
// //                 value: '1',
// //                 child: Text('Approved'),
// //               ),
// //               PopupMenuItem<String>(
// //                 value: '2',
// //                 child: Text('Rejected'),
// //               ),
// //               PopupMenuItem<String>(
// //                 value: 'all',
// //                 child: Text('All'),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //       drawer: Drawer(
// //         child: Padding(
// //           padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
// //           child: Column(
// //             children: [
// //               ListTile(
// //                 title: Text("Official Vacations"),
// //                 leading: Icon(Icons.home),
// //                 onTap: () {
// //                   // Handle navigation or action
// //                 },
// //               ),
// //               // Add more ListTile items as needed
// //             ],
// //           ),
// //         ),
// //       ),
// //       body: GetBuilder<EmpvacatcontrollerImp>(
// //         builder: (controller) => WillPopScope(
// //           onWillPop: alertExitApp,
// //           child: Container(
// //             padding: EdgeInsets.all(16),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 Expanded(
// //                   child: ListView.separated(
// //                     itemCount: controller.empVacations.length,
// //                     separatorBuilder: (context, index) => SizedBox(height: 8),
// //                     itemBuilder: (context, index) {
// //                       return Card(
// //                         elevation: 2,
// //                         child: InkWell(
// //                           onTap: () {
// //                             Get.bottomSheet(CancelBookingBottomsheet(
// //                                 empvacation: controller.empVacations[index]));
// //                           },
// //                           child: ListitemnameItemWidget(
// //                               itemvacation: controller.empVacations[index]),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class CancelBookingBottomsheet extends StatelessWidget {
// //   final EmpVacation empvacation;

// //   CancelBookingBottomsheet({required this.empvacation});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Container(
// //         padding: EdgeInsets.all(16),
// //         decoration: AppDecoration.outlineGray8002
// //             .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             // Your bottom sheet content here
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // chat 1

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:empolyeeapp/controller/hr/empvacation/empvacatcontroller.dart';
// // import 'package:empolyeeapp/core/app_export.dart';
// // import 'package:empolyeeapp/core/functions/alertelogoteadmin.dart';
// // import 'package:empolyeeapp/core/functions/alertexitapp.dart';
// // import 'package:empolyeeapp/data/model/empvacation.dart';
// // import 'package:empolyeeapp/screen/admin/empvacation/itemvacation.dart';

// // class Empvacationview extends StatelessWidget {
// //   final EmpvacatcontrollerImp controller = Get.put(EmpvacatcontrollerImp());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Employee Vacations"),
// //         centerTitle: true,
// //         backgroundColor: ColorConstant.gray900,
// //       ),
// //       drawer: Drawer(
// //         child: Padding(
// //           padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
// //           child: Column(
// //             children: [
// //               ListTile(
// //                 title: Text("Official Vacations"),
// //                 leading: Icon(Icons.home),
// //                 onTap: () {
// //                   // Handle navigation or action
// //                 },
// //               ),
// //               // Add more ListTile items as needed
// //             ],
// //           ),
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           controller.felterdata('0');
// //         },
// //         child: Icon(Icons.filter_list),
// //         tooltip: "Filter Vacations",
// //       ),
// //       body: GetBuilder<EmpvacatcontrollerImp>(
// //         builder: (controller) => WillPopScope(
// //           onWillPop: alertExitApp,
// //           child: Container(
// //             padding: EdgeInsets.all(16),
// //             child: ListView.separated(
// //               itemCount: controller.empvact.length,
// //               separatorBuilder: (context, index) => SizedBox(height: 8),
// //               itemBuilder: (context, index) {
// //                 return Card(
// //                   elevation: 2,
// //                   child: InkWell(
// //                     onTap: () {
// //                       Get.bottomSheet(CancelBookingBottomsheet(
// //                           empvacation: controller.empvact[index]));
// //                     },
// //                     child: ListitemnameItemWidget(
// //                         itemvacation: controller.empvact[index]),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class CancelBookingBottomsheet extends StatelessWidget {
// //   final EmpVacation empvacation;

// //   CancelBookingBottomsheet({required this.empvacation});

// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //       child: Container(
// //         padding: EdgeInsets.all(16),
// //         decoration: AppDecoration.outlineGray8002
// //             .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             // Your bottom sheet content here
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:empolyeeapp/controller/hr/empvacation/empvacatcontroller.dart';
// // import 'package:empolyeeapp/core/app_export.dart';
// // import 'package:empolyeeapp/core/functions/alertelogoteadmin.dart';
// // import 'package:empolyeeapp/core/functions/alertexitapp.dart';
// // import 'package:empolyeeapp/core/functions/translatefatabase.dart';
// // import 'package:empolyeeapp/data/model/empvacation.dart';
// // import 'package:empolyeeapp/screen/admin/empvacation/itemvacation.dart';

// // import 'package:empolyeeapp/widgets/custom_button.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // // ignore: must_be_immutable
// // class Empvacationview extends StatelessWidget {
// //   EmpvacatcontrollerImp controller = Get.put(EmpvacatcontrollerImp());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Center(child: Text("vacationssss")),
// //           backgroundColor: ColorConstant.gray900,
// //         ),
// //             drawer: Drawer(
// //           child: Padding(
// //             padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
// //             child: Column(
// //               children: [
// //                 ListTile(
// //                   title: Text("الاجازت لرسميه"),
// //                   leading: Icon(Icons.home),
// //                   onTap: () {

// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),

// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {
// //            controller.felterdata('0');
// //           },
// //           child: Icon(Icons.add),
// //         ),
// //         body: GetBuilder<EmpvacatcontrollerImp>(
// //           builder: (controller) => WillPopScope(
// //             onWillPop: alertExitApp,
// //             child: Container(
// //               child: Padding(
// //                 padding: getPadding(top: 22, right: 14, left: 14),
// //                 child: ListView.builder(
// //                   // itemCount:1,
// //                     itemCount: controller.empvact.length,
// //                     itemBuilder: (context, index) {
// //                       return  InkWell(child: ListitemnameItemWidget(itemvacation: controller.empvact[index],),onTap: () {
// //                         Get.bottomSheet(CancelBookingBottomsheet(empvacation: controller.empvact[index],));
// //                       },);

// //                     }),
// //               ),
// //             ),
// //           ),
// //         ));
// //   }
// // }

// // class CancelBookingBottomsheet extends StatelessWidget {
// // final EmpVacation empvacation ;
// //   CancelBookingBottomsheet({required this.empvacation} );

// //   @override
// //   Widget build(BuildContext context) {
// //     return SingleChildScrollView(
// //         child: Container(
// //             width: double.maxFinite,
// //             child: Container(
// //                 width: double.maxFinite,
// //                 padding: getPadding(left: 24, top: 8, right: 24, bottom: 8),
// //                 decoration: AppDecoration.outlineGray8002
// //                     .copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
// //                 child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     children: [
// //                       CustomImageView(
// //                           svgPath: ImageConstant.imgFrameGray700,
// //                           height: getVerticalSize(3),
// //                           width: getHorizontalSize(38)),
// //                       Padding(
// //                           padding: getPadding(top: 26),
// //                           child: Text("Cancel Booking",
// //                               overflow: TextOverflow.ellipsis,
// //                               textAlign: TextAlign.left,
// //                               style: AppStyle.txtRobotoRegular16)),
// //                       Container(
// //                           width: getHorizontalSize(340),
// //                           margin: getMargin(left: 19, top: 26, right: 19),
// //                           child: Text('',
// //                               // "${'19'.tr} $orderid",
// //                               maxLines: null,
// //                               textAlign: TextAlign.center,
// //                               style: AppStyle.txtUrbanistRomanBold20)),
// //                       Container(
// //                           width: getHorizontalSize(372),
// //                           margin: getMargin(left: 3, top: 8, right: 3),
// //                           child: Text(
// //                               "${empvacation.userEmail}",
// //                               maxLines: null,
// //                               textAlign: TextAlign.center,
// //                               style: AppStyle.txtUrbanistRegular14WhiteA700
// //                                   .copyWith(
// //                                       letterSpacing: getHorizontalSize(0.2)))),
// //                       Padding(
// //                           padding: getPadding(top: 22, bottom: 58),
// //                           child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               children: [
// //                                 Expanded(
// //                                   child: CustomButton(
// //                                     height: getVerticalSize(58),
// //                                     text: "Cancel",
// //                                     margin: getMargin(right: 6),
// //                                     variant: ButtonVariant.FillGray800,
// //                                   ),
// //                                 ),
// //                                 Expanded(
// //                                     child: CustomButton(
// //                                         height: getVerticalSize(58),
// //                                         text: "Continue",
// //                                         margin: getMargin(left: 6),
// //                                         variant:
// //                                             ButtonVariant.OutlineGreenA7003f,
// //                                         onTap: () {
// //                                           Get.back();
// //                                         }))
// //                               ]))
// //                     ]))));
// //   }
// // }
