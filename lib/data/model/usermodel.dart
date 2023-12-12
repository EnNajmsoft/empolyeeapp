class UserModel {
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

  UserModel(
      {this.userId,
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

  UserModel.fromJson(Map<String, dynamic> json) {
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
