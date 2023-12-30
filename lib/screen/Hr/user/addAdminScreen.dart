// import 'package:empolyeeapp/core/utils/color_constant.dart';
// import 'package:empolyeeapp/theme/app_decoration.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class AddManagersScreen extends StatelessWidget {
//   const AddManagersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(children: [
//                _buildInputField(
//               controller: controller.jopName,
//               label: 'اسم الوظيفة',
//               hint: 'أدخل اسم الوظيفة',
//             ),
//             SizedBox(height: 16),
//                  _buildInputField(
//               controller: controller.jopName,
//               label: 'اسم الوظيفة',
//               hint: 'أدخل اسم الوظيفة',
//             ),
//             SizedBox(height: 16),
//                  _buildInputField(
//               controller: controller.jopName,
//               label: 'اسم الوظيفة',
//               hint: 'أدخل اسم الوظيفة',
//             ),
//             SizedBox(height: 16),
//                  _buildInputField(
//               controller: controller.jopName,
//               label: 'اسم الوظيفة',
//               hint: 'أدخل اسم الوظيفة',
//             ),
//             SizedBox(height: 16),
//               customInputField(
//               controller: controller.departmentManger,
//               label: 'مدير',
//               hint: 'حدد المدير',
//               readOnly: true,
//               onTap: () {
//                 Get.bottomSheet(VacationBottomSheet());
//               },
//               suffixIcon: Icons.arrow_drop_down,
//             ),
//            CustomButton(
//               onTap: () => controller.addDepartement(),
//               text: 'إضافة',
//               height: 50,
//               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
//             ), 
//         ],),
//       ),
//     );
//   }
  
//   Widget _buildInputField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     bool readOnly = false,
//     VoidCallback? onTap,
//     IconData? suffixIcon,
//   }) {
//     return TextFormField(
//       controller: controller,
//       readOnly: readOnly,
//       onTap: onTap,
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         labelStyle: TextStyle(color: Color(0xFF2697B0)),
//         border: OutlineInputBorder(),
//         suffixIcon: suffixIcon != null
//             ? InkWell(
//                 onTap: onTap,
//                 child: Icon(suffixIcon),
//               )
//             : null,
//       ),
//     );
//   }
// }


// class VacationBottomSheet extends StatelessWidget {
//   final AddDepartcontrollerImp controller = Get.put(AddDepartcontrollerImp());

//   VacationBottomSheet();

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Container(
//       height: 300,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: ColorConstant.cyan700,
//       ).copyWith(borderRadius: BorderRadiusStyle.customBorderTL40),
//       child: ListView.builder(
//         itemCount: controller.usersmodel!.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               ListTile(
//                 title: Text(controller.usersmodel![index].userUsername!),
//                 subtitle: Text(controller.usersmodel![index].jopName!),
//                 onTap: () {
//                   controller.usersmodel!.first = controller.usersmodel![index];
//                   controller.departmentManger.text =
//                       controller.usersmodel![index].userUsername!;
//                   controller.mangerId = controller.usersmodel![index].userId!;
//                   print(controller.departmentManger.text);
//                   print(controller.mangerId);
//                   Navigator.pop(context);
//                 },
//               ),
//               const Divider(),
//             ],
//           );
//         },
//       ),
//     ));
//   }
// }
