class DepartementModel {
  String? userId;
  String? userUsername;
  String? userEmail;
  String? userPassw;
  String? userPhone;
  String? userToken;
  String? userJopId;
  String? userVerficycod;
  String? userType;
  String? userApproval;
  String? userCreate;
  String? departId;
  String? departName;
  String? departManger;
  String? departNote;
  String? departCreate;

  DepartementModel(
      {this.userId,
      this.userUsername,
      this.userEmail,
      this.userPassw,
      this.userPhone,
      this.userToken,
      this.userJopId,
      this.userVerficycod,
      this.userType,
      this.userApproval,
      this.userCreate,
      this.departId,
      this.departName,
      this.departManger,
      this.departNote,
      this.departCreate});

  DepartementModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userUsername = json['userUsername'];
    userEmail = json['userEmail'];
    userPassw = json['userPassw'];
    userPhone = json['userPhone'];
    userToken = json['userToken'];
    userJopId = json['userJopId'];
    userVerficycod = json['userVerficycod'];
    userType = json['userType'];
    userApproval = json['userApproval'];
    userCreate = json['userCreate'];
    departId = json['departId'];
    departName = json['departName'];
    departManger = json['departManger'];
    departNote = json['departNote'];
    departCreate = json['departCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userUsername'] = this.userUsername;
    data['userEmail'] = this.userEmail;
    data['userPassw'] = this.userPassw;
    data['userPhone'] = this.userPhone;
    data['userToken'] = this.userToken;
    data['userJopId'] = this.userJopId;
    data['userVerficycod'] = this.userVerficycod;
    data['userType'] = this.userType;
    data['userApproval'] = this.userApproval;
    data['userCreate'] = this.userCreate;
    data['departId'] = this.departId;
    data['departName'] = this.departName;
    data['departManger'] = this.departManger;
    data['departNote'] = this.departNote;
    data['departCreate'] = this.departCreate;
    return data;
  }
}
