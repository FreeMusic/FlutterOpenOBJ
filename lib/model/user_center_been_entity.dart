class ProvinceModel {
  int code;
  List<String> data;
  String msg;

  ProvinceModel({this.code, this.data, this.msg});

  ProvinceModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'].cast<String>();
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['data'] = this.data;
    data['msg'] = this.msg;
    return data;
  }
}
