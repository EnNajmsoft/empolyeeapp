class JopModel {
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

  JopModel(
      {this.jopId,
      this.departIdJop,
      this.jopName,
      this.jopNote,
      this.jopCreate,
      this.departId,
      this.departName,
      this.departManger,
      this.departNote,
      this.departCreate});

  JopModel.fromJson(Map<String, dynamic> json) {
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
