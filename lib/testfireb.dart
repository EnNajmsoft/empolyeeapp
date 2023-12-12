// import 'package:empolyeeapp/widgets/custom_button.dart';
// import 'package:empolyeeapp/widgets/custom_textfild.dart';
// import 'package:flutter/material.dart';
// import 'package:empolyeeapp/routes/app_routes.dart';

// // Import the firebase_core and cloud_firestore plugin
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class AddDepartScreent extends StatelessWidget {
//   // const addepartscreent({super.key});
//   GlobalKey<FormState> formstateadtt = GlobalKey<FormState>();

//   TextEditingController vacationname = TextEditingController();
//   TextEditingController vacationnote = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference vacationType =
//         FirebaseFirestore.instance.collection('vacation_type');
//     addVacation() async {
//       if (formstateadtt.currentState!.validate()) {
//         try {
//           DocumentReference respons = await vacationType.add({
//             'vacation_name': vacationname.text, // John Doe
//             'vacation_note': vacationnote.text, // Stokes and Sons
//           });
//           Get.toNamed(AppRoutes.testscren);
//         } catch (e) {
//           print('=================== error $e ====================');
//         }
//       } else {
//           print('errorvaditor');
//       }
//       // Call the user's CollectionReference to add a new user
//       //   return vacationType
//       //       .add({
//       //         'vacation_name': vacationname.text, // John Doe
//       //         'vacation_note': vacationnote.text, // Stokes and Sons
//       //       })
//       //       .then((value) => print("User Added"))
//       //       .catchError((error) => print("Failed to add user: $error"));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: Text('test fire base'),
//       ),
//       body: Container(
//         child: Column(children: [
//           Form(
//             key: formstateadtt,
//             child: Column(children: [
//               TextFormField(
//                 controller: vacationname,
//                 decoration: const InputDecoration(
//                   labelText: 'ملاحظة الإجازة',
//                 ),
//               ),
//               TextFormField(
//                 controller: vacationnote,
//                 decoration: const InputDecoration(
//                   labelText: 'ملاحظة الإجازة',
//                 ),
//               ),
//               CustomButton(
//                 height: 50,
//                 width: 85,
//                 text: "Submit ",
//                 onTap: () {
//                   addVacation();
//                 },
//               ),
//             ]),
//           )
//         ]),
//       ),
//     );
//   }
// }
// // class AddDepartScreent extends StatelessWidget {
// //   final String fullName;
// //   final String company;
// //   final int age;

// //   AddDepartScreent(this.fullName, this.company, this.age);

// //   @override
// //   Widget build(BuildContext context) {
// //     // Create a CollectionReference called users that references the firestore collection
// //     CollectionReference users = FirebaseFirestore.instance.collection('users');

// //     Future<void> addUser() {
// //       // Call the user's CollectionReference to add a new user
// //       return users
// //           .add({
// //             'full_name': fullName, // John Doe
// //             'company': company, // Stokes and Sons
// //             'age': age // 42
// //           })
// //           .then((value) => print("User Added"))
// //           .catchError((error) => print("Failed to add user: $error"));
// //     }

// //     return TextButton(
// //       onPressed: addUser,
// //       child: Text(
// //         "Add User",
// //       ),
// //     );
// //   }
// // }
