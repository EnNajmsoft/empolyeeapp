class DepartementModel {
  String? departId;
  String? departName;
  String? departManger;
  String? departNote;
  String? departCreate;

  DepartementModel(
      {this.departId,
      this.departName,
      this.departManger,
      this.departNote,
      this.departCreate});

  DepartementModel.fromJson(Map<String, dynamic> json) {
    departId = json['departId'];
    departName = json['departName'];
    departManger = json['departManger'];
    departNote = json['departNote'];
    departCreate = json['departCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departId'] = this.departId;
    data['departName'] = this.departName;
    data['departManger'] = this.departManger;
    data['departNote'] = this.departNote;
    data['departCreate'] = this.departCreate;
    return data;
  }
}
