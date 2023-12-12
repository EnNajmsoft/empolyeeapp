import 'package:empolyeeapp/controller/empolyee/vacation/viewcontrooler.dart';
import 'package:empolyeeapp/core/app_export.dart';
import 'package:empolyeeapp/core/functions/alertexitapp.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class testscren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
 Column(
      children: [
        // Generated code for this Column Widget...
      Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            child: ListTile(
              title: Text(
                'Title',
                // style: FlutterFlowTheme.of(context).titleLarge,
              ),
              subtitle: Text(
                'Subtitle goes here...',
                // style: FlutterFlowTheme.of(context).labelMedium,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                // color: FlutterFlowTheme.of(context).secondaryText,
                size: 20,
              ),
              tileColor: Color(0xE9FFFFFF),
              dense: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: ColorConstant.witeeee,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    color: Color(0x33000000),
                    offset: Offset(0, 15),
                    spreadRadius: 8,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          // Generated code for this Container Widget...
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: ColorConstant.witeeee,
                // color: FlutterFlowTheme.of(context).accent4,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    color: Color(0x33000000),
                    offset: Offset(0, 15),
                    spreadRadius: 8,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
   Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: ColorConstant.witeeee,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    color: Color(0x33000000),
                    offset: Offset(0, 15),
                    spreadRadius: 8,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),  // Generated code for this Container Widget...
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1C88B6), Color(0xFFE19691)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0.03, -1),
                  end: AlignmentDirectional(-0.03, 1),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
CustomButton(onTap: () {
  Get.bottomSheet( CancelBookingBottomsheet()  );
},)
        ],
      )

        // Container(
        //   width: 375,
        //   height: 812,
        //   clipBehavior: Clip.antiAlias,
        //   decoration: const BoxDecoration(color: Color(0xFFCBD5E0)),
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         left: 0,
        //         top: 244,
        //         child: Container(
        //           width: 375,
        //           height: 568,
        //           decoration: const ShapeDecoration(
        //             color: Colors.white,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(48),
        //                 topRight: Radius.circular(48),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //       const Positioned(
        //         left: 52,
        //         top: 285,
        //         child: Text(
        //           'Upgrade plan to \nhighly experience',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             color: Color(0xFF4A5568),
        //             fontSize: 32,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w600,
        //             height: 0.04,
        //             letterSpacing: -0.32,
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         left: 24,
        //         top: 433,
        //         child: Container(
        //           width: 327,
        //           height: 132,
        //           child: Stack(
        //             children: [
        //               Positioned(
        //                 left: 0,
        //                 top: 0,
        //                 child: Container(
        //                   width: 327,
        //                   height: 132,
        //                   decoration: ShapeDecoration(
        //                     color: Colors.white,
        //                     shape: RoundedRectangleBorder(
        //                       side: BorderSide(width: 1, color: Color(0xFFA0AEC0)),
        //                       borderRadius: BorderRadius.circular(24),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               const Positioned(
        //                 left: 20,
        //                 top: 19,
        //                 child: Text(
        //                   'Basic plan ',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     color: Color(0xFF718096),
        //                     fontSize: 14,
        //                     fontFamily: 'Inter',
        //                     fontWeight: FontWeight.w400,
        //                     height: 0.10,
        //                   ),
        //                 ),
        //               ),
        //               const Positioned(
        //                 left: 24,
        //                 top: 76,
        //                 child: Text.rich(
        //                   TextSpan(
        //                     children: [
        //                       TextSpan(
        //                         text: '\$40',
        //                         style: TextStyle(
        //                           color: Color(0xFF718096),
        //                           fontSize: 26,
        //                           fontFamily: 'Inter',
        //                           fontWeight: FontWeight.w600,
        //                           height: 0.03,
        //                         ),
        //                       ),
        //                       TextSpan(
        //                         text: ' ',
        //                         style: TextStyle(
        //                           color: Color(0xFF718096),
        //                           fontSize: 24,
        //                           fontFamily: 'Inter',
        //                           fontWeight: FontWeight.w600,
        //                           height: 0.03,
        //                         ),
        //                       ),
        //                       TextSpan(
        //                         text: '/month',
        //                         style: TextStyle(
        //                           color: Color(0xFF718096),
        //                           fontSize: 14,
        //                           fontFamily: 'Inter',
        //                           fontWeight: FontWeight.w400,
        //                           height: 0.10,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //               const Positioned(
        //                 left: 168,
        //                 top: 19,
        //                 child: Text(
        //                   'Perfect your starters',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     color: Color(0xFF4A5568),
        //                     fontSize: 14,
        //                     fontFamily: 'Inter',
        //                     fontWeight: FontWeight.w400,
        //                     height: 0.10,
        //                   ),
        //                 ),
        //               ),
        //               Positioned(
        //                 left: 264,
        //                 top: 65,
        //                 child: Container(
        //                   width: 42,
        //                   height: 42,
        //                   child: Stack(
        //                     children: [
        //                       Positioned(
        //                         left: 0,
        //                         top: 0,
        //                         child: Container(
        //                           width: 42,
        //                           height: 42,
        //                           decoration: const ShapeDecoration(
        //                             color: Color(0xFFE2E8F0),
        //                             shape: OvalBorder(),
        //                           ),
        //                         ),
        //                       ),
        //                       Positioned(
        //                         left: 33,
        //                         top: 9,
        //                         child: Transform(
        //                           transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
        //                           child: Container(
        //                             width: 24,
        //                             height: 24,
        //                             clipBehavior: Clip.antiAlias,
        //                             decoration: BoxDecoration(),
        //                             child: Stack(children: [
                                
        //                             ]),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         left: 24,
        //         top: 581,
        //         child: Container(
        //           width: 327,
        //           height: 192,
        //           child: Stack(
        //             children: [
        //               Positioned(
        //                 left: 0,
        //                 top: 0,
        //                 child: Container(
        //                   width: 327,
        //                   height: 192,
        //                   decoration: ShapeDecoration(
        //                     color: Color(0xFFEDF2F7),
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(24),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               Positioned(
        //                 left: 9,
        //                 top: 44,
        //                 child: Container(
        //                   width: 309,
        //                   height: 139,
        //                   decoration: ShapeDecoration(
        //                     color: Color(0xFFA0AEC0),
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(24),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               const Positioned(
        //                 left: 24,
        //                 top: 74,
        //                 child: Text(
        //                   'Basic plan ',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 14,
        //                     fontFamily: 'Inter',
        //                     fontWeight: FontWeight.w400,
        //                     height: 0.10,
        //                   ),
        //                 ),
        //               ),
        //               const Positioned(
        //                 left: 164,
        //                 top: 74,
        //                 child: Text(
        //                   'Perfect your starters',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 14,
        //                     fontFamily: 'Inter',
        //                     fontWeight: FontWeight.w400,
        //                     height: 0.10,
        //                   ),
        //                 ),
        //               ),
        //               const Positioned(
        //                 left: 113,
        //                 top: 12,
        //                 child: Text(
        //                   'Recommended',
        //                   textAlign: TextAlign.center,
        //                   style: TextStyle(
        //                     color: Color(0xFF4A5568),
        //                     fontSize: 14,
        //                     fontFamily: 'Inter',
        //                     fontWeight: FontWeight.w400,
        //                     height: 0.10,
        //                   ),
        //                 ),
        //               ),
        //               const Positioned(
        //                 left: 25,
        //                 top: 128,
        //                 child: Text.rich(
        //                   TextSpan(
        //                     children: [
        //                       TextSpan(
        //                         text: '\$70',
        //                         style: TextStyle(
        //                           color: Colors.white,
        //                           fontSize: 26,
        //                           fontFamily: 'Inter',
        //                           fontWeight: FontWeight.w600,
        //                           height: 0.03,
        //                         ),
        //                       ),
        //                       TextSpan(
        //                         text: ' dxccxvxvc',
        //                         style: TextStyle(
        //                           color: Colors.white,
        //                           fontSize: 24,
        //                           fontFamily: 'Inter',
        //                           fontWeight: FontWeight.w600,
        //                           height: 0.03,
        //                         ),
        //                       ),
        //                       TextSpan(
        //                         text: '/month',
        //                         style: TextStyle(
        //                           color: Colors.white,
        //                           fontSize: 14,
        //                           fontFamily: 'Inter',
        //                           fontWeight: FontWeight.w400,
        //                           height: 0.10,
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //               Positioned(
        //                 left: 260,
        //                 top: 117,
        //                 child: Container(
        //                   width: 42,
        //                   height: 42,
        //                   child: Stack(
        //                     children: [
        //                       Positioned(
        //                         left: 0,
        //                         top: 0,
        //                         child: Container(
        //                           width: 42,
        //                           height: 42,
        //                           decoration: ShapeDecoration(
        //                             color: Color(0xFFE2E8F0),
        //                             shape: OvalBorder(),
        //                           ),
        //                         ),
        //                       ),
        //                       Positioned(
        //                         left: 33,
        //                         top: 9,
        //                         child: Transform(
        //                           transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
        //                           child: Container(
        //                             width: 24,
        //                             height: 24,
        //                             clipBehavior: Clip.antiAlias,
        //                             decoration: BoxDecoration(),
        //                             child: Stack(children: [
                                    
        //                             ]),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       const Positioned(
        //         left: 59,
        //         top: 382,
        //         child: Text(
        //           'ras sit amet varius augue, ut malesuada ',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             color: Color(0xFFA0AEC0),
        //             fontSize: 13,
        //             fontFamily: 'Inter',
        //             fontWeight: FontWeight.w400,
        //             height: 0.12,
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         left: 48,
        //         top: 53,
        //         child: Transform(
        //           transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-1.57),
        //           child: Container(
        //             width: 24,
        //             height: 24,
        //             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.86),
        //             clipBehavior: Clip.antiAlias,
        //             decoration: BoxDecoration(),
        //             child: Row(
        //               mainAxisSize: MainAxisSize.min,
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Container(
        //                   width: 14,
        //                   height: 18.29,
        //                   child: Stack(children: [
                          
        //                   ]),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ]
   
 )

    );
  
}
}



class CancelBookingBottomsheet extends StatelessWidget {
  CancelBookingBottomsheet();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Container(
            width: double.maxFinite,
            child: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 8, right: 24, bottom: 8),
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
                              style: AppStyle.txtUrbanistRomanBold24RedA200)),
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
                          child: Text(
                              "Only 80% of the money you can refund from your payment according to our policy",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtUrbanistRegular14WhiteA700
                                  .copyWith(
                                      letterSpacing: getHorizontalSize(0.2)))),
                      Padding(
                          padding: getPadding(top: 22, bottom: 58),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    height: getVerticalSize(58),
                                    text: "Cancel",
                                    margin: getMargin(right: 6),
                                    variant: ButtonVariant.FillGray800,
                                  ),
                                ),
                                Expanded(
                                    child: CustomButton(
                                        height: getVerticalSize(58),
                                        text: "Continue",
                                        margin: getMargin(left: 6),
                                        variant:
                                            ButtonVariant.OutlineGreenA7003f,
                                        onTap: () {
                                          Get.back();
                                        }))
                              ]))
                    ]))));
  }


}
