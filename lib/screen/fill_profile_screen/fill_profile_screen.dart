import 'package:empolyeeapp/core/app_export.dart';
import 'package:empolyeeapp/widgets/app_bar/appbar_image.dart';
import 'package:empolyeeapp/widgets/app_bar/appbar_title.dart';
import 'package:empolyeeapp/widgets/app_bar/custom_app_bar.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:empolyeeapp/widgets/custom_drop_down.dart';
import 'package:empolyeeapp/widgets/custom_phone_number.dart';
import 'package:empolyeeapp/widgets/custom_text_form_field.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/signup_controller.dart';
import '../../core/functions/validinput.dart';

// ignore: must_be_immutable
class FillProfileScreen extends StatelessWidget {
  SignUpControllerImp controller = Get.put(SignUpControllerImp());

  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('967');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray900,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
            height: getVerticalSize(38),
            leadingWidth: 52,
            leading: AppbarImage(
                height: getSize(28),
                width: getSize(28),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 24, top: 11, bottom: 9),
                onTap: () {
                  Get.toNamed(AppRoutes.signInScreen);
                }),
            centerTitle: true,
            title: AppbarTitle(text: "Fill Your Profile")),
        body: Container(
            width: double.maxFinite,
            padding: getPadding(left: 24, top: 24, right: 24, bottom: 24),
            child: ListView(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                      height: getSize(140),
                      width: getSize(140),
                      child: Stack(alignment: Alignment.bottomRight, children: [
                        // CustomImageView(
                        //     imagePath: ImageConstant.imgEllipse140x140,
                        //     height: getSize(140),
                        //     width: getSize(140),
                        //     radius:
                        //         BorderRadius.circular(getHorizontalSize(70)),
                        //     alignment: Alignment.center),
                        // CustomImageView(
                        //     svgPath: ImageConstant.imgEdit,
                        //     height: getSize(35),
                        //     width: getSize(35),
                        //     alignment: Alignment.bottomRight)
                      ])),
                  Form(
                    key: controller.formstatetow,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          validator: (value) {
                            return validInput(value!, 13, 30, 'email');
                          },
                          focusNode: FocusNode(),
                          controller: controller.email,
                          hintText: "Email",
                          margin: getMargin(top: 46),
                          padding: TextFormFieldPadding.PaddingT21,
                          fontStyle:
                              TextFormFieldFontStyle.UrbanistRegular14Gray500,
                          textInputType: TextInputType.emailAddress,
                          prefix: Container(
                            margin: getMargin(
                                left: 20, top: 20, right: 12, bottom: 20),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgCheckmark),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: getVerticalSize(60),
                          ),
                        ),
                        GetBuilder<SignUpControllerImp>(
                          builder: (controller) => CustomTextFormField(
                              validator: (value) {
                                return validInput(value!, 6, 30, '');
                              },
                              focusNode: FocusNode(),
                              controller: controller.password,
                              hintText: "Password",
                              margin: getMargin(top: 24),
                              padding: TextFormFieldPadding.PaddingT21_1,
                              fontStyle: TextFormFieldFontStyle
                                  .UrbanistRegular14Gray500,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              prefix: Container(
                                  margin: getMargin(
                                      left: 20, top: 20, right: 12, bottom: 20),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgLock)),
                              prefixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60)),
                              suffix: Container(
                                  margin: getMargin(
                                      left: 30, top: 20, right: 20, bottom: 20),
                                  child: CustomImageView(
                                      onTap: () {
                                        controller.showPassword();
                                      },
                                      svgPath: ImageConstant.imgDashboard)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(60)),
                              isObscureText: controller.isshowpassword),
                        ),
                        CustomTextFormField(
                            validator: (value) {
                              return validInput(value!, 10, 30, '');
                            },
                            focusNode: FocusNode(),
                            controller: controller.username,
                            hintText: "Full Name",
                            margin: getMargin(top: 24),
                            fontStyle: TextFormFieldFontStyle
                                .UrbanistRegular14Gray500),
                        _buildInputField(
                          controller: controller.jopid,
                          label: 'مدير',
                          hint: 'حدد المدير',
                          readOnly: true,
                          onTap: () => _showDepartmentsMenu(context),
                          suffixIcon: Icons.arrow_drop_down,
                        ),

                        Padding(
                            padding: getPadding(top: 24),
                            child: CustomPhoneNumber(
                                validator: (value) {
                                  return validInput(value!, 9, 30, 'phone');
                                },
                                country: selectedCountry,
                                controller: controller.phone,
                                onTap: (Country country) {
                                  controller.selectedCountry = country;
                                })),
                        // CustomDropDown(
                        //     focusNode: FocusNode(),
                        //     icon: Container(
                        //       decoration: BoxDecoration(
                        //           gradient: LinearGradient(
                        //             colors: [
                        //               Color(0xFF1C88B6),
                        //               Color(0xFFE19691)
                        //             ],
                        //             stops: [0, 1],
                        //             begin: AlignmentDirectional(0.03, -1),
                        //             end: AlignmentDirectional(-0.03, 1),
                        //           ),
                        //           borderRadius: BorderRadius.circular(155),
                        //         ),
                        //         margin: getMargin(left: 30, right: 20),
                        //         child: CustomImageView(
                        //             svgPath: ImageConstant.imgFavorite)),
                        //     hintText: "Gender",
                        //     margin: getMargin(top: 24, bottom: 5),

                        //     fontStyle: DropDownFontStyle.UrbanistRegular14,
                        //     items: controller.dropdownItemList,
                        //     onChanged: (value) {
                        //       print(value);
                        //       print(controller.email);
                        //       if (value == "maile") {
                        //         controller.jopid = "1";
                        //       } else {
                        //         controller.jopid = "2";
                        //       }
                        //     }),
                        CustomButton(
                          height: getVerticalSize(55),
                          text: "Sign in",
                          margin: getMargin(top: 24),
                          variant: ButtonVariant.FillCyan600,
                          onTap: () {
                            controller.signUp();
                            print(controller.formstatetow.currentWidget);
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            )),
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
        labelStyle: TextStyle(color: Colors.red),
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

  void _showDepartmentsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color.fromARGB(255, 46, 45, 45),
           shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.zero, top: Radius.circular(50)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.zero ,top: Radius.circular(50)),
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 26, 55, 67), Color(0xFFE19691)],
              stops: [0, 1],
              begin: AlignmentDirectional(0.03, -1),
              end: AlignmentDirectional(-0.03, 1),
            ),
          ),
          child: ListView.builder(
            itemCount: controller.jops.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.jops[index].jopName!),
                onTap: () {
                  controller.jops.first = controller.jops[index];
                  controller.jopid.text = controller.jops[index].jopName!;
                  controller.jopselect = controller.jops[index].jopId!;
                  print(controller.jopid.text);
                  print(controller.jopselect);
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}
