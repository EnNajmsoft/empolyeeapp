import 'package:empolyeeapp/controller/admin/onevacacontroller.dart';
import 'package:empolyeeapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class Onevacation extends StatelessWidget {
  OnevaacontrolImp controller = Get.put(OnevaacontrolImp());

  Onevacation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text("name"),
                  SizedBox(width: 20,),

                  MaterialButton(
                           child: Text("${controller.onevacation!.userUsername}"),
                    onPressed:() {
                      // controller.approvalvac();
                    }, ),
                    

               
                ],
              ),
              Row(
                children: [
                  Text("row2"),
                  SizedBox(
                    width: 20,
                  ),

                  Text("${controller.onevacation!.vacationStart}"),
                ],
              ),
              Row(
                children: [
                  Text("hr"),
                  SizedBox(
                    width: 20,
                  ),

                  Text("${controller.onevacation!.vacationStateHr}"),
                ],
              ),
              CustomButton(
                height: 100,
                text: "طلب الاجازة",
                onTap: () {
                  controller.approvalvac();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
