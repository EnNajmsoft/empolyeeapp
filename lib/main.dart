import 'package:empolyeeapp/bindings/intialbindings.dart';
import 'package:empolyeeapp/core/localization/changelocal.dart';
import 'package:empolyeeapp/core/localization/translation.dart';
import 'package:empolyeeapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empolyeeapp/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
// void main() async {
//   await initialServices();
//   runApp(MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  await initialServices();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      theme: ThemeData(
        visualDensity: VisualDensity.standard,
      ),
      title: 'hotel relaxe',
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.addvacationtscreen,
      initialBinding: InitialBindings(),
      // initialRoute: AppRoutes.empvacationview,
      // initialRoute: AppRoutes.empvacationdepview,
      // initialRoute: AppRoutes.signUpBlankScreen,
      initialRoute: AppRoutes.signInScreen,
      getPages: routes,
    );
  }
}
