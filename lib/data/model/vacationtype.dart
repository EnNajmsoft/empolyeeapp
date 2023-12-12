class VacationTypeModel {
  String? vacationTypeId;
  String? vacationTypeName;
  String? vacationTypeNote;
  String? vacationTypeCreate;

  VacationTypeModel(
      {this.vacationTypeId,
      this.vacationTypeName,
      this.vacationTypeNote,
      this.vacationTypeCreate});

  VacationTypeModel.fromJson(Map<String, dynamic> json) {
    vacationTypeId = json['vacationTypeId'];
    vacationTypeName = json['vacationTypeName'];
    vacationTypeNote = json['vacationTypeNote'];
    vacationTypeCreate = json['vacationTypeCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vacationTypeId'] = this.vacationTypeId;
    data['vacationTypeName'] = this.vacationTypeName;
    data['vacationTypeNote'] = this.vacationTypeNote;
    data['vacationTypeCreate'] = this.vacationTypeCreate;
    return data;
  }
}
