import 'package:empolyeeapp/controller/admin/vacationDeparController.dart';
import 'package:empolyeeapp/screen/admin/oneVacationScreen.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/core/app_export.dart';
import 'package:empolyeeapp/core/functions/alertexitapp.dart';
import 'package:empolyeeapp/data/model/empvacation.dart';
import 'package:intl/intl.dart';

class EmpVacationDepView extends StatelessWidget {
  final AdminVacationControllerImp controller =
      Get.put(AdminVacationControllerImp());

   EmpVacationDepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 230, 225, 237),

      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: CustomAppBar(),
      ),
      drawer: const CustomDrawer(),
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
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        onChanged: (value) {
                          // Update the list when the search value changes
                        },
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.tune,
                      ),
                      onSelected: (value) {
                        controller.filterData(value);
                      },
                      itemBuilder: (BuildContext context) => [
                       const  PopupMenuItem<String>(
                          value: '0',
                          child: Text('Pending'),
                        ),
                        const PopupMenuItem<String>(
                          value: '1',
                          child: Text('Approved'),
                        ),
                      const  PopupMenuItem<String>(
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
              const   SizedBox(height: 10),
                Expanded(
                  child: Container(
                        padding: EdgeInsets.fromLTRB(5, 18, 5, 0),

decoration :BoxDecoration(
                        color: Color.fromARGB(248, 244, 241, 248),
  borderRadius: BorderRadius.vertical(top: Radius.circular(20) ,bottom: Radius.zero)),
                


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
                                  
                        return VacationCard(formattedStartDate: formattedStartDate, 
                        formattedEndDate: formattedEndDate,
                         empVacation: controller.empVacations[index],);
                      },
                    ),
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

class VacationCard extends StatelessWidget {
  const VacationCard({
    super.key,
    required this.formattedStartDate,
    required this.formattedEndDate, required this.empVacation,
  });
  final EmpVacationModel empVacation;
  final String formattedStartDate;
  final String formattedEndDate;

  @override
  Widget build(BuildContext context) {
    return Card(
       shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(19.0), // تعديل قيمة الانحناء حسب الرغبة
      ),  // BorderRadius.all(Radius.circular(90)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Get.bottomSheet(VacationBottomSheet(
              empvacation: empVacation));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.person_4,
                      size: 40,
                    ),
                    Column(children: [
                      Text(
                        '${empVacation.userUsername}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        '${empVacation.jopName}/${empVacation.departName}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ]),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "From: ${formattedStartDate}",
                      style:
                          TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "To: ${formattedEndDate}",
                      style:
                          TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "المدير",
                        style: TextStyle(
                            color: Colors.grey[700]),
                      ),
                  empVacation
                                  .vacationStateAdmin ==
                              '0'
                          ? Text(
                              " في الانتظار ",
                              style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 250, 232, 27)),
                            )
                          : empVacation
                                      .vacationStateAdmin ==
                                  '1'
                              ? Text(
                                  " تمت الموافقه ",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 6, 216, 37)),
                                )
                              : Text(
                                  " تم الرفض",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 226, 17, 17)),
                                ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        " الموارد البشرية",
                        style: TextStyle(
                            color: Colors.grey[700]),
                      ),
                     empVacation
                                  .vacationStateHr ==
                              '0'
                          ? Text(
                              " في الانتظار ",
                              style: TextStyle(
                                  color: Color.fromARGB(
                                      255, 250, 232, 27)),
                            )
                          : empVacation
                                      .vacationStateHr ==
                                  '1'
                              ? Text(
                                  " تمت الموافقه ",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 6, 216, 37)),
                                )
                              : Text(
                                  " تم الرفض",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 226, 17, 17)),
                                ),
                    ],
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
              title: Text("الاجازات"),
              leading: Icon(Icons.local_fire_department),
              onTap: () {
                Get.toNamed(AppRoutes.vacationtpyeview);
              },
            ),
            ListTile(
              title: Text("الاقسام"),
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
             ListTile(
              title: Text("الاعدادات"),
              leading: Icon(Icons.settings),
              onTap: () {
                Get.toNamed(AppRoutes.settings);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VacationBottomSheet extends StatelessWidget {
  final AdminVacationControllerImp controller =
      Get.put(AdminVacationControllerImp());
  final EmpVacationModel empvacation;

  VacationBottomSheet({required this.empvacation});

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
              width: getHorizontalSize(38),
            ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: empvacation.vacationStateAdmin == "2"
                        ? Text("مرفوض")
                        : CustomButton(
                            height: getVerticalSize(58),
                            text: "رفض",
                            margin: getMargin(right: 6),
                            variant: ButtonVariant.FillGray800,
                            onTap: () {
                              controller.rejectVac(empvacation.empVacationId);
                              Get.back();
                            },
                          ),
                  ),
                  Expanded(
                    child: empvacation.vacationStateAdmin == "1"
                        ? Text("مقبول")
                        : CustomButton(
                            height: getVerticalSize(58),
                            text: "قبول",
                            margin: getMargin(left: 6),
                            variant: ButtonVariant.OutlineGreenA7003f,
                            onTap: () {
                              controller.approvalVac(empvacation.empVacationId);
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
            top: Radius.zero, bottom: Radius.circular(40)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.zero, bottom: Radius.circular(40)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 112, 218, 236),
                Color.fromARGB(255, 2, 142, 149)
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(0.03, -1),
              end: AlignmentDirectional(-0.03, 1),
            ),
          ),
        ),
      ),
      title: Text("Admin Vacations"),
       centerTitle: true,
    );
  }
}
