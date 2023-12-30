import 'package:empolyeeapp/controller/hr/department/AddDepartController.dart';
import 'package:empolyeeapp/controller/hr/department/EditeDepartCantroller.dart';
import 'package:empolyeeapp/core/functions/validinput.dart';
import 'package:empolyeeapp/core/utils/color_constant.dart';
import 'package:empolyeeapp/data/datasource/remote/hr/UserData.dart';
import 'package:empolyeeapp/theme/app_decoration.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/widgets/custom_text_form_field.dart';

class EditeDepartScreen extends StatelessWidget {
  final EditeDepartcontrollerImp controller = Get.put(EditeDepartcontrollerImp());

  EditeDepartScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          titleapbar: 'تعديل قسم ',
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
                  label: ' اسم القسم',
                  hint: ' ${controller.departNameargum}',
                

                  borderradius: BorderRadius.circular(12),
                ),
                SizedBox(height: 16),
                customInputField(
                  controller: controller.departmentManger,
                  
                  label: 'مدير',
                  hint: ' ${controller.mangerName}',
                  readOnly: true,
                  onTap: () {
                    Get.bottomSheet(VacationBottomSheet());
                  },
                  suffixIcon: Icons.arrow_drop_down,
                ),
                SizedBox(height: 16),
                customInputField(
                  controller: controller.departmentNote,
                  label: ' ملاحظة',
                  hint: ' ${controller.departNoteargum}',
                ),
                SizedBox(height: 24),
                CustomButton(
                  onTap: () => controller.editeDepartement(),
                  text: 'تعديل',
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


}
class VacationBottomSheet extends StatelessWidget {
  final EditeDepartcontrollerImp controller = Get.put(EditeDepartcontrollerImp());

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
                leading: Text(controller.usersmodel![index].userEmail!),
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
