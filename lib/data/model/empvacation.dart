class EmpVacationModel {
  String? empVacationId;
  String? vacationTId;
  String? vacationUserId;
  String? vacationStateAdmin;
  String? vacationStateHr;
  String? vacationStart;
  String? vacationEnd;
  String? vacationNote;
  String? vacationFile;
  String? vacationCreate;
  String? vacationTypeId;
  String? vacationTypeName;
  String? vacationTypeNote;
  String? vacationTypeCreate;
  String? userId;
  String? userUsername;
  String? userEmail;
  String? userPassw;
  String? userPhone;
  String? userJopId;
  String? userVerficycod;
  String? userType;
  String? userApproval;
  String? userCreate;
  String? jopId;
  String? departIdJop;
  String? jopName;
  String? jopNote;
  String? jopCreate;
  String? departId;
  String? departName;
  String? departManger;
  String? departNote;
  String? departCreate;

  EmpVacationModel(
      {this.empVacationId,
      this.vacationTId,
      this.vacationUserId,
      this.vacationStateAdmin,
      this.vacationStateHr,
      this.vacationStart,
      this.vacationEnd,
      this.vacationNote,
      this.vacationFile,
      this.vacationCreate,
      this.vacationTypeId,
      this.vacationTypeName,
      this.vacationTypeNote,
      this.vacationTypeCreate,
      this.userId,
      this.userUsername,
      this.userEmail,
      this.userPassw,
      this.userPhone,
      this.userJopId,
      this.userVerficycod,
      this.userType,
      this.userApproval,
      this.userCreate,
      this.jopId,
      this.departIdJop,
      this.jopName,
      this.jopNote,
      this.jopCreate,
      this.departId,
      this.departName,
      this.departManger,
      this.departNote,
      this.departCreate});

  EmpVacationModel.fromJson(Map<String, dynamic> json) {
    empVacationId = json['empVacationId'];
    vacationTId = json['vacationTId'];
    vacationUserId = json['VacationUserId'];
    vacationStateAdmin = json['vacationStateAdmin'];
    vacationStateHr = json['vacationStateHr'];
    vacationStart = json['vacationStart'];
    vacationEnd = json['vacationEnd'];
    vacationNote = json['vacationNote'];
    vacationFile = json['vacationFile'];
    vacationCreate = json['vacationCreate'];
    vacationTypeId = json['vacationTypeId'];
    vacationTypeName = json['vacationTypeName'];
    vacationTypeNote = json['vacationTypeNote'];
    vacationTypeCreate = json['vacationTypeCreate'];
    userId = json['userId'];
    userUsername = json['userUsername'];
    userEmail = json['userEmail'];
    userPassw = json['userPassw'];
    userPhone = json['userPhone'];
    userJopId = json['userJopId'];
    userVerficycod = json['userVerficycod'];
    userType = json['userType'];
    userApproval = json['userApproval'];
    userCreate = json['userCreate'];
    jopId = json['jopId'];
    departIdJop = json['departIdJop'];
    jopName = json['jopName'];
    jopNote = json['jopNote'];
    jopCreate = json['jopCreate'];
    departId = json['departId'];
    departName = json['departName'];
    departManger = json['departManger'];
    departNote = json['departNote'];
    departCreate = json['departCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empVacationId'] = this.empVacationId;
    data['vacationTId'] = this.vacationTId;
    data['VacationUserId'] = this.vacationUserId;
    data['vacationStateAdmin'] = this.vacationStateAdmin;
    data['vacationStateHr'] = this.vacationStateHr;
    data['vacationStart'] = this.vacationStart;
    data['vacationEnd'] = this.vacationEnd;
    data['vacationNote'] = this.vacationNote;
    data['vacationFile'] = this.vacationFile;
    data['vacationCreate'] = this.vacationCreate;
    data['vacationTypeId'] = this.vacationTypeId;
    data['vacationTypeName'] = this.vacationTypeName;
    data['vacationTypeNote'] = this.vacationTypeNote;
    data['vacationTypeCreate'] = this.vacationTypeCreate;
    data['userId'] = this.userId;
    data['userUsername'] = this.userUsername;
    data['userEmail'] = this.userEmail;
    data['userPassw'] = this.userPassw;
    data['userPhone'] = this.userPhone;
    data['userJopId'] = this.userJopId;
    data['userVerficycod'] = this.userVerficycod;
    data['userType'] = this.userType;
    data['userApproval'] = this.userApproval;
    data['userCreate'] = this.userCreate;
    data['jopId'] = this.jopId;
    data['departIdJop'] = this.departIdJop;
    data['jopName'] = this.jopName;
    data['jopNote'] = this.jopNote;
    data['jopCreate'] = this.jopCreate;
    data['departId'] = this.departId;
    data['departName'] = this.departName;
    data['departManger'] = this.departManger;
    data['departNote'] = this.departNote;
    data['departCreate'] = this.departCreate;
    return data;
  }
}
