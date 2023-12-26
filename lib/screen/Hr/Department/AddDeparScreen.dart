import 'package:empolyeeapp/controller/hr/department/AddDepartController.dart';
import 'package:empolyeeapp/core/functions/validinput.dart';
import 'package:empolyeeapp/core/utils/color_constant.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
import 'package:empolyeeapp/theme/app_decoration.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/widgets/custom_text_form_field.dart';

class AddDepartScreen extends StatelessWidget {
  final AddDepartcontrollerImp controller = Get.put(AddDepartcontrollerImp());

  AddDepartScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          titleapbar: 'اضافة قسم جديد',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Padding(
          padding: EdgeInsets.all(26.0),
          child: Form(
            key: controller.formStateAddDepar,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                customInputField(
                  controller: controller.departmentName,
                  label: 'اسم القسم',
                  hint: 'أدخل اسم القسم',
                  borderradius: BorderRadius.circular(12),
                ),
                SizedBox(height: 16),
                customInputField(
                  controller: controller.departmentManger,
                  label: 'مدير',
                  hint: 'حدد المدير',
                  readOnly: true,
                  onTap: () {
                    Get.bottomSheet(VacationBottomSheet());
                  },
                  suffixIcon: Icons.arrow_drop_down,
                ),
                SizedBox(height: 16),
                customInputField(
                  controller: controller.departmentNote,
                  label: 'ملاحظة حول القسم',
                  hint: 'أدخل ملاحظة',
                ),
                SizedBox(height: 24),
                CustomButton(
                  onTap: () => controller.addDepartement(),
                  text: 'إضافة',
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool readOnly = false,
    VoidCallback? onTap,
    IconData? suffixIcon,
    BorderRadius? borderradius,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Color(0xFF2697B0)),
        border: OutlineInputBorder(
          borderRadius:
              borderradius != null ? borderradius : BorderRadius.circular(12),
        ),
        suffixIcon: suffixIcon != null
            ? InkWell(
                onTap: onTap,
                child: Icon(suffixIcon),
              )
            : null,
      ),
    );
  }

  Widget _buildElevatedButton({
    required VoidCallback onPressed,
    required String label,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      child: Container(child: Text(label)),
    );
  }

  void _showDepartmentsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
              color: ColorConstant.cyan600,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.zero, top: Radius.circular(90))),
          child: ListView.builder(
            itemCount: controller.usersmodel!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(controller.usersmodel![index].userUsername!),
                    subtitle: Text(controller.usersmodel![index].jopName!),
                    onTap: () {
                      controller.usersmodel!.first =
                          controller.usersmodel![index];
                      controller.departmentManger.text =
                          controller.usersmodel![index].userUsername!;
                      controller.mangerId =
                          controller.usersmodel![index].userId!;
                      print(controller.departmentManger.text);
                      print(controller.mangerId);
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class VacationBottomSheet extends StatelessWidget {
  final AddDepartcontrollerImp controller = Get.put(AddDepartcontrollerImp());

  VacationBottomSheet();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstant.cyan700,
      ).copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
      child: ListView.builder(
        itemCount: controller.usersmodel!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(controller.usersmodel![index].userUsername!),
                subtitle: Text(controller.usersmodel![index].jopName!),
                onTap: () {
                  controller.usersmodel!.first = controller.usersmodel![index];
                  controller.departmentManger.text =
                      controller.usersmodel![index].userUsername!;
                  controller.mangerId = controller.usersmodel![index].userId!;
                  print(controller.departmentManger.text);
                  print(controller.mangerId);
                  Navigator.pop(context);
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    ));
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleapbar;
  const CustomAppBar({super.key, required this.titleapbar});

  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(0)),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.zero, bottom: Radius.circular(0)),
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
      title: Text(titleapbar),
      centerTitle: true,
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text(" اضافة قسم جديد"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: controller.formStateAddDepar,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: controller.departmentName,
//                 decoration: InputDecoration(
//                   labelText: 'اسم  القسم',
//                   labelStyle: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(height: 10),
//                  Expanded(
//                 child: TextField(
//                   controller: controller.departmentManger,
//                   decoration: InputDecoration(
//                     labelText: 'مدير',
//                     labelStyle: TextStyle(color: Colors.red),
//                   ),
//                   readOnly: true, // Make the TextField read-only
//                   onTap: () {
//                     showMenu(
//                       context: context,
//                       position: RelativeRect.fromLTRB(0, 0, 0, 0),
//                       items: controller.usersmodel!.map((item) {
//                         return PopupMenuItem<UserModel>(
//                           value: item,
//                           child: Text('${item.userUsername}'),
//                         );
//                       }).toList(),
//                     ).then((selectedValue) {
//                       if (selectedValue != null) {
//                         controller.usersmodel!.first = selectedValue;
//                         controller.departmentManger.text =
//                             selectedValue.userUsername!;
//                         controller.departmentManger.text =
//                             selectedValue.userUsername!;
//                                   controller.mangerId= selectedValue.userId!;
//                         print(controller.departmentManger.text);
//                         print(controller.mangerId);
//                       }
//                     });
//                   },
//                 ),
//               ),
//               TextFormField(
//                 controller: controller.departmentNote,
//                 decoration: InputDecoration(
//                   labelText: 'ملاحظة حول القسم',
//                 ),
//               ),
//               SizedBox(height: 20),
//               CustomButton(
//                 height: 50,
//                 text: "إضافة",
//                 onTap: () {
//                   controller.addDepartement();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:empolyeeapp/controller/admin/vacationType/addController.dart';
// import 'package:empolyeeapp/core/functions/alertexitapp.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class addVacationtScreen extends StatelessWidget {
//   AddcontrollerImp controller = Get.put(AddcontrollerImp());

//   addVacationtScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("طلب اجازه"),
//       ),
//       body: WillPopScope(
//         onWillPop: alertExitApp,
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: controller.formstateaddvact,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                  TextField(
//                   controller: controller.vacationname,
//                   decoration: const InputDecoration(
//                       labelText: 'اسم نوع الاجازه ',
//                       labelStyle: TextStyle(color: Colors.red)),
//                 ),
//                  TextField(
//                   controller: controller.vacationnote,

//                   decoration: const InputDecoration(
//                     labelText: 'ملاحظه الاجازة',
//                   ),
//                 ),
//                const SizedBox(height: 10),
//                 CustomButton(
//                   height: 50,
//                   text: "اضافة ",
//                   onTap: () {
//                     controller.addvacationt();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
