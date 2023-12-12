
import 'package:empolyeeapp/screen/Hr/Department/AddDeparScreen.dart';
import 'package:empolyeeapp/screen/Hr/Department/ViewDepartment.dart';
import 'package:empolyeeapp/screen/Hr/EmployeeScreen/employeeScreen.dart';
import 'package:empolyeeapp/screen/Hr/vacation/empvacationview.dart';
import 'package:empolyeeapp/screen/Hr/vacation/onevacation.dart';
import 'package:empolyeeapp/screen/Hr/jop/addJopScreen.dart';
import 'package:empolyeeapp/screen/Hr/jop/viewJopScreen.dart';
import 'package:empolyeeapp/screen/Hr/vacationType/addVacationType.dart';
import 'package:empolyeeapp/screen/Hr/vacationType/viewVacationType.dart';
import 'package:empolyeeapp/screen/admin/vacationsScreen/vacationsScreen.dart';
import 'package:empolyeeapp/screen/empolyee/addvacation.dart';
import 'package:empolyeeapp/screen/empolyee/homescreen.dart';
import 'package:empolyeeapp/screen/sign_up_blank_screen/verifycodesingup.dart';
import 'package:empolyeeapp/screen/splash_screen/binding/splash_binding.dart';
import 'package:empolyeeapp/screen/splash_screen/splash_screen.dart';
import 'package:empolyeeapp/test.dart';
import 'package:empolyeeapp/testchatgpt.dart';
import 'package:empolyeeapp/testfireb.dart';
import 'package:get/get.dart';
import '../core/middleware/mymiddleware.dart';
import '../screen/fill_profile_screen/fill_profile_screen.dart';
import '../screen/sign_in_screen/sign_in_screen.dart';


class AppRoutes {
  //*****************test************ */

  static const String testscren = "/testscren";
  static const String testchat = "/testchat";
  static const String addepartscreent = '/addepartscreent';




 
  static const String splashScreen = "/splashScreen";

  static const String languageScreen = '/language_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String onboardingOneScreen = '/onboarding_one_screen';

  static const String onboardingTwoScreen = '/onboarding_two_screen';

  static const String onboardingThreeScreen = '/onboarding_three_screen';

  static const String letSYouInScreen = '/let_s_you_in_screen';
//================  auth  ====================================//

  static const String signUpBlankScreen = '/sign_up_blank_screen';

  static const String virifycodesingupScreen = '/virify_code_singup_Screen';

  static const String signInScreen = '/sign_in_screen';

  static const String fillProfileScreen = '/fill_profile_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String forgotPasswordTypeOtpScreen =
      '/forgot_password_type_otp_screen';

  static const String forgotPasswordFilledTypeScreen =
      '/forgot_password_filled_type_screen';

  static const String createNewPasswordScreen = '/create_new_password_screen';


//==========================================================================//


  static const String profileSettingsPage = '/profile_settings_page';

  static const String editProfileScreen = '/edit_profile_screen';



  static const String initialRoute = '/initialRoute';

  //============== hr ========//
  static const String onevacation = '/onevacation';
  static const String vacationtpyeview = '/vacationtpyeview';
  static const String departementview = '/departementview';
  static const String addepartscreen = '/addepartscreen';
  static const String employeedepview= '/employeedepview';
  static const String jopview= '/jopview';
  static const String addjop= '/addjop';


  //============== admin ========//
  

  static const String empvacationview = '/Empvacationview';
  static const String addvacationtscreen = '/add_vacationtscreen';

  static const String empvacationdepview = '/empvacationdepview';




  //=============================== empolyee =========================
  static const String emphome = '/emp_home';
  static const String empuservacation = '/empuservacation';
  static const String addvacationempolyee = '/addvacationempolyee';


}

List<GetPage<dynamic>>? routes = [

  //   GetPage(
  //     name: AppRoutes.splashScreen,
  //     page: () => SplashScreen(),
  //        bindings: [
  //   SplashBinding(),
  // ],
  //=============================== hr =========================
  GetPage(name: AppRoutes.empvacationview, page: () => EmpVacationView()),
  GetPage(name: AppRoutes.onevacation, page: () =>  Onevacation()),
  GetPage(name: AppRoutes.departementview, page: () =>  DepartementView()),
  GetPage(name: AppRoutes.addepartscreen, page: () =>  AddDepartScreen()),
  GetPage(name: AppRoutes.vacationtpyeview, page: () => VacationTpyeView()),
  GetPage(name: AppRoutes.employeedepview, page: () => EmployeeScreen()),
  GetPage(name: AppRoutes.jopview, page: () => ViewJopScreen()),
  GetPage(name: AppRoutes.addjop, page: () => AddDJopScreen()),
  
  
  
  // GetPage(name: AppRoutes.addepartscreent, page: () => AddDepartScreent()),

  //=============================== empolyee =========================
  GetPage(name: AppRoutes.emphome, page: () => Emphome()),
  GetPage(name: AppRoutes.addvacationempolyee, page: () => AddVacation()),

  //=============================== admin =========================
  GetPage(name: AppRoutes.empvacationdepview, page: () => EmpVacationDepView()),



   GetPage( name: "/", page: () =>  SplashScreen(), middlewares: [MyMiddleWare()],  bindings: [SplashBinding()],),
  // GetPage(name: AppRoutes.languageScreen, page: () => const LanguageScreen()),
  // GetPage(
  //   name: AppRoutes.welcomeScreen,
  //   page: () => WelcomeScreen(),
  //   bindings: [WelcomeBinding()],
  // ),
  // GetPage(
  //     name: AppRoutes.onboardingOneScreen, page: () => OnboardingOneScreen()),
  // GetPage(
  //     name: AppRoutes.onboardingTwoScreen, page: () => OnboardingTwoScreen()),
  // GetPage(
  //     name: AppRoutes.onboardingThreeScreen,
  //     page: () => OnboardingThreeScreen()),


  GetPage(name: AppRoutes.testscren, page: () => testscren()),
  // GetPage(name: AppRoutes.testchat, page: () => TestChat(itemvacation: null,)),
  
  GetPage(name: AppRoutes.addvacationtscreen, page: () => AddVacationScreen()),
//  Auth
  // GetPage(name: AppRoutes.signUpBlankScreen, page: () => SignUpBlankScreen()),

  GetPage(name: AppRoutes.virifycodesingupScreen, page: () => VirifycodeSingupScreen()),
  GetPage(name: AppRoutes.signInScreen, page: () => SignInScreen(), middlewares: [MyMiddleWare()],),
  GetPage(name: AppRoutes.fillProfileScreen, page: () => FillProfileScreen()),

  // GetPage(name: AppRoutes.forgotPasswordScreen, page: () => ForgotPasswordScreen()),
  // GetPage(name: AppRoutes.forgotPasswordTypeOtpScreen, page: () => ForgotPasswordTypeOtpScreen()),
  // GetPage(name: AppRoutes.forgotPasswordFilledTypeScreen, page: () => ForgotPasswordFilledTypeScreen()),
  // GetPage(
  //     name: AppRoutes.createNewPasswordScreen,
  //     page: () => CreateNewPasswordScreen()),


];
