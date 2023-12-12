import 'package:empolyeeapp/core/app_export.dart';

import 'package:empolyeeapp/data/model/empvacation.dart';

import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ListitemnameItemWidget extends StatelessWidget {
  EmpVacationModel itemvacation;

  ListitemnameItemWidget({required this.itemvacation});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 5,
        bottom: 5,
      ),
      padding: getPadding(
        left: 15,
        top: 12,
        right: 15,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 41, 143, 186), Color(0xFFE19691)],
          stops: [0, 1],
          begin: AlignmentDirectional(0.03, -1),
          end: AlignmentDirectional(-0.03, 1),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: getPadding(
              left: 1,
              top: 2,
              right: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${itemvacation.userUsername}  ",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUrbanistSemiBold18,
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    "${itemvacation.departName}  ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistSemiBold18,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    "${itemvacation.vacationCreate}  ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistSemiBold18,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 2,
              right: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${itemvacation.vacationTypeName}  ",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUrbanistSemiBold18,
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    "${itemvacation.vacationStart}  ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistSemiBold18,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    "${itemvacation.vacationEnd}  ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistSemiBold18,
                  ),
                ),
                // Padding(
                //   padding: getPadding(
                //     top: 2,
                //     bottom: 2,
                //   ),
                //   child: Text(
                //     // rangeEnd!.difference(rangeStart!).inDays
                //     "${itemvacation.vacationDays}  ",
                //     overflow: TextOverflow.ellipsis,
                //     textAlign: TextAlign.left,
                //     style: AppStyle.txtUrbanistSemiBold18,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 1,
              top: 2,
              right: 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${itemvacation.vacationTypeName}  ",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtUrbanistSemiBold18,
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    "${itemvacation.vacationStart}  ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistSemiBold18,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    "${itemvacation.vacationEnd}  ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistSemiBold18,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 2,
                    bottom: 2,
                  ),
                  child: Text(
                    // rangeEnd!.difference(rangeStart!).inDays
                    "${itemvacation.vacationStateAdmin}  ",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtUrbanistSemiBold18,
                  ),
                ),
              ],
            ),
          ),
        
          // Padding(
          //   padding: getPadding(
          //     left: 1,
          //     top: 5,
          //   ),
          //   child: Row(
          //     children: [
          //       CustomButton(
          //         height: getVerticalSize(
          //           24,
          //         ),
          //         width: getHorizontalSize(
          //           93,
          //         ),
          //         text: "18/05/2022",
          //         fontStyle: ButtonFontStyle.UrbanistSemiBold10RedA200,
          //         suffixWidget: Container(
          //           margin: getMargin(
          //             left: 4,
          //           ),
          //         ),
          //       ),
          //       Spacer(),
          //       Padding(
          //         padding: getPadding(
          //           top: 3,
          //           bottom: 3,
          //         ),
          //         child: Text(
          //           "REJECT",
          //           overflow: TextOverflow.ellipsis,
          //           textAlign: TextAlign.left,
          //           style: AppStyle.txtGilroyMedium14Bluegray400,
          //         ),
          //       ),
          //       Padding(
          //         padding: getPadding(
          //           left: 16,
          //           top: 3,
          //           bottom: 3,
          //         ),
          //         child: Text(
          //           "APPROVE",
          //           overflow: TextOverflow.ellipsis,
          //           textAlign: TextAlign.left,
          //           style: AppStyle.txtGilroyMedium14Bluegray400,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
