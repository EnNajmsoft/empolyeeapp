class AppLink {
  static const String server = "http://192.168.88.43:8080/empolee_app";



// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  // static const String loginadmin = "$server/auth/loginadmin.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";
// ================================= Admin ========================== //

// ================================= empolyee ========================== //
  static const String empuservacatview = "$server/empvacation/view.php";
  static const String empuservacatadd  = "$server/empvacation/add.php";


// ================================= hr ========================== //
  static const String empvacatview = "$server/empvacation/viewall.php";
  static const String empvacatviewone = "$server/empvacation/view.php";

  static const String approvalvac = "$server/hr/approvalvac.php";
  static const String rejectvac = "$server/hr/rejectvac.php";

  static const String vacationttypeadd = "$server/vacaiontype/add.php";
  static const String vacationtypeview = "$server/vacaiontype/view.php";
  static const String vacationtypeedit = "$server/vacaiontype/edit.php";

  static const String  departmentview = "$server/department/view.php";
  static const String  departmentadd = "$server/department/add.php";
  static const String  departmentedite = "$server/department/edit.php";

  static const String userview = "$server/user/viewall.php";
  static const String userviewdep = "$server/user/viewdep.php";
  static const String viewwituser = "$server/user/viewWitUser.php";
  static const String approvaluser = "$server/hr/approvaluser.php";
  static const String rejectuser = "$server/hr/rejectuser.php";



  static const String jopviewall = "$server/jop/viewall.php";
  static const String jopviewa = "$server/jop/view.php";
  static const String jopadd = "$server/jop/add.php";

// ================================= admin ========================== //
  static const String empvacatdepview = "$server/empvacation/viewdepr.php";

  static const String approvalAdminvac = "$server/admin/approvalvac.php";
  static const String rejectAdminvac = "$server/admin/reject.php";


// ================================= test ========================== //

  static const String test = "http://169.254.246.73:8080/empolee_app/user/viewall.php";

}
