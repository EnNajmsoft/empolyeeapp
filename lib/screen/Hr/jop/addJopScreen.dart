import 'package:empolyeeapp/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/controller/hr/jop/addJopController.dart';
import 'package:empolyeeapp/data/model/DepartementModel.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';

class AddDJopScreen extends StatelessWidget {
  final AddJopControllerImp controller = Get.put(AddJopControllerImp());

  AddDJopScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          titleapbar: 'jop',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Padding(
          padding: EdgeInsets.all(26.0),
          child: Form(
            key: controller.formStateAddJop,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [




                
                _buildInputField(
                  controller: controller.jopName,
                  label: 'اسم الوظيفة',
                  hint: 'أدخل اسم الوظيفة',
                ),
                SizedBox(height: 16),
                _buildInputField(
                  controller: controller.jopdepart,
                  label: 'القسم ',
                  hint: 'حدد القسم',
                  readOnly: true,
                  onTap: () => _showDepartmentsMenu(context),
                  suffixIcon: Icons.arrow_drop_down,
                ),
                SizedBox(height: 16),
                _buildInputField(
                  controller: controller.jopdepart,
                  label: 'القسم ',
                  hint: 'حدد القسم',
                  readOnly: true,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          child: ListView.builder(
                            itemCount: controller.jopsdep.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text(' قسم  : '
                                        "${controller.jopsdep[index].jopNote!}"),
                                    subtitle: Text(' مدير القسم  : '
                                        "${controller.jopsdep[index].jopName!}"),
                                    onTap: () {
                                      controller.departements.first =
                                          controller.departements[index];
                                      controller.jopdepart.text = controller
                                          .departements[index].departName!;
                                   
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
                  },
                  suffixIcon: Icons.arrow_drop_down,
                ),
                SizedBox(height: 16),
                _buildInputField(
                  controller: controller.jopNote,
                  label: 'ملاحظة حول الوظيفة',
                  hint: 'أدخل ملاحظة',
                ),
                SizedBox(height: 24),
                _buildElevatedButton(
                  onPressed: () => controller.addJop(),
                  label: 'إضافة',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool readOnly = false,
    VoidCallback? onTap,
    IconData? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: Color(0xFF2697B0)),
        border: OutlineInputBorder(),
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
          child: ListView.builder(
            itemCount: controller.departements.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(' قسم  : '
                        "${controller.departements[index].departName!}"),
                    subtitle: Text(' مدير القسم  : '
                        "${controller.departements[index].userUsername!}"),
                    onTap: () {
                      controller.departements.first =
                          controller.departements[index];
                      controller.jopdepart.text =
                          controller.departements[index].departName!;
                      controller.departid =
                          controller.departements[index].departId!;
                      print(controller.jopdepart.text);
                      print(controller.departid);
                      // controller.viewJoopdep(controller.departid);
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleapbar;
  const CustomAppBar({super.key, required this.titleapbar});

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
      title: Text("$titleapbar"),
      centerTitle: true,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:empolyeeapp/controller/hr/jop/addJopController.dart';
// import 'package:empolyeeapp/data/model/DepartementModel.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';

// class AddDJopScreen extends StatelessWidget {
//   final AddJopControllerImp controller = Get.put(AddJopControllerImp());

//   AddDJopScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("إضافة قسم جديد"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: controller.formStateAddJop,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               _buildInputField(
//                 controller: controller.jopName,
//                 label: 'اسم الوظيفة',
//                 hint: 'أدخل اسم الوظيفة',
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: controller.jopdepart,
//                 label: 'مدير',
//                 hint: 'حدد المدير',
//                 readOnly: true,
//                 onTap: () => _showDepartmentsMenu(context),
//                 suffixIcon: Icons.arrow_drop_down, // تحديث هنا
//               ),
//               SizedBox(height: 16),
//               _buildInputField(
//                 controller: controller.jopNote,
//                 label: 'ملاحظة حول الوظيفة',
//                 hint: 'أدخل ملاحظة',
//               ),
//               SizedBox(height: 24),
//               _buildElevatedButton(
//                 onPressed: () => controller.addJop(),
//                 label: 'إضافة',
//               ),
//             ],
//           ),
//         ),
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
//         labelStyle: TextStyle(color: Colors.red),
//         border: OutlineInputBorder(),
//         suffix: suffixIcon != null
//             ? InkWell(
//                 onTap: onTap,
//                 child: Icon(suffixIcon),
//               )
//             : null,
//       ),
//     );
//   }

//   Widget _buildElevatedButton({
//     required VoidCallback onPressed,
//     required String label,
//   }) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.symmetric(vertical: 16),
//       ),
//       child: Text(label),
//     );
//   }

//   void _showDepartmentsMenu(BuildContext context) {
//     showMenu(
//       context: context,
//       position: RelativeRect.fromLTRB(0, 0, 0, 0),
//       items: controller.departements.map((item) {
//         return PopupMenuItem<DepartementModel>(
//           value: item,
//           child: Text('${item.departName}'),
//         );
//       }).toList(),
//     ).then((selectedValue) {
//       if (selectedValue != null) {
//         controller.departements.first = selectedValue;
//         controller.jopdepart.text = selectedValue.departName!;
//         controller.departid = selectedValue.departId!;
//         print(controller.jopdepart.text);
//         print(controller.departid);
//       }
//     });
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:empolyeeapp/controller/hr/jop/addJopController.dart';
// import 'package:empolyeeapp/data/model/DepartementModel.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';

// class AddDJopScreen extends StatelessWidget {
//   final AddJopControllerImp controller = Get.put(AddJopControllerImp());

//   AddDJopScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("إضافة قسم جديد"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: controller.formStateAddJop,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: controller.jopName,
//                 decoration: InputDecoration(
//                   labelText: 'اسم الوظيفة',
//                   labelStyle: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: controller.jopdepart,
//                 decoration: InputDecoration(
//                   labelText: 'مدير',
//                   labelStyle: TextStyle(color: Colors.red),
//                 ),
//                 readOnly: true,
//                 onTap: () {
//                   _showDepartmentsMenu(context);
//                 },
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: controller.jopNote,
//                 decoration: InputDecoration(
//                   labelText: 'ملاحظة حول الوظيفة',
//                 ),
//               ),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () {
//                   controller.addJop();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 16),
//                 ),
//                 child: Text("إضافة"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showDepartmentsMenu(BuildContext context) {
//     showMenu(
//       context: context,
//       position: RelativeRect.fromLTRB(0, 0, 0, 0),
//       items: controller.departements.map((item) {
//         return PopupMenuItem<DepartementModel>(
//           value: item,
//           child: Text('${item.departName}'),
//         );
//       }).toList(),
//     ).then((selectedValue) {
//       if (selectedValue != null) {
//         controller.departements.first = selectedValue;
//         controller.jopdepart.text = selectedValue.departName!;
//         controller.departid = selectedValue.departId!;
//         print(controller.jopdepart.text);
//         print(controller.departid);
//       }
//     });
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:empolyeeapp/controller/hr/jop/addJopController.dart';
// import 'package:empolyeeapp/data/model/DepartementModel.dart';
// import 'package:empolyeeapp/widgets/custom_button.dart';

// class AddDJopScreen extends StatelessWidget {
//   final AddJopControllerImp controller = Get.put(AddJopControllerImp());

//   AddDJopScreen();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("إضافة قسم جديد"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: controller.formStateAddJop,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: controller.jopName,
//                 decoration: InputDecoration(
//                   labelText: 'اسم الوظيفة',
//                   labelStyle: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: controller.jopdepart,
//                 decoration: InputDecoration(
//                   labelText: 'مدير',
//                   labelStyle: TextStyle(color: Colors.red),
//                 ),
//                 readOnly: true,
//                 onTap: () {
//                   showMenu(
//                     context: context,
//                     position: RelativeRect.fromLTRB(0, 0, 0, 0),
//                     items: controller.departements.map((item) {
//                       return PopupMenuItem<DepartementModel>(
//                         value: item,
//                         child: Text('${item.departName}'),
//                       );
//                     }).toList(),
//                   ).then((selectedValue) {
//                     if (selectedValue != null) {
//                       controller.departements.first = selectedValue;
//                       controller.jopdepart.text = selectedValue.departName!;
//                       controller.departid = selectedValue.departId!;
//                       print(controller.jopdepart.text);
//                       print(controller.departid);
//                     }
//                   });
//                 },
//               ),
//               TextFormField(
//                 controller: controller.jopNote,
//                 decoration: InputDecoration(
//                   labelText: 'ملاحظة حول الوظيفة',
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   controller.addJop();
//                 },
//                 style: ElevatedButton.styleFrom(
//                     // Customize the style if needed
//                     ),
//                 child: Text("إضافة"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
