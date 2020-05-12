

/*图形验证码通用接口Model*/
class BaseModel {
  int code;
  int data;
  String msg;

  BaseModel({this.code, this.data, this.msg});

  @override
  String toString() {
    return 'BaseModel{code: $code, data: $data, msg: $msg}';
  }

  BaseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
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
