import 'package:empolyeeapp/controller/hr/vacationeType/editVacaTypeCantroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class editVacationTypeScreen extends StatelessWidget {
  final EditVacationTypecontrollerImp controller = Get.put(EditVacationTypecontrollerImp());

  editVacationTypeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: CustomAppBar(
          titleapbar: 'تعدي نوع اجازه ',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Padding(
          padding: EdgeInsets.all(26.0),
          child: Form(
            key: controller.formstateaddvact,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInputField(
                  controller: controller.vacationname,
                  label: 'اسم نوع الإجازة',
                  hint: ' ${controller.vacationname}',
                ),
                SizedBox(height: 16),
                _buildInputField(
                  controller: controller.vacationnote,
                  label: 'ملاحظة حول الإجازة',
                  hint: ' ${controller.vacationnote}',
                ),
                SizedBox(height: 24),
                _buildElevatedButton(
                  onPressed: () => controller.editVacationtType(),
                  label: 'تعدي',
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



