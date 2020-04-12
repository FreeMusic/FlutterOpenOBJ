
//是否注册app的接口
class LoginOrRegisterModel {
  int code;
  int data;
  String msg;

  LoginOrRegisterModel({this.code, this.data, this.msg});

  LoginOrRegisterModel.fromJson(Map<String, dynamic> json) {
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

/*图形验证码通用接口Model*/
class CaptchasModel {
  int code;
  int data;
  String msg;

  CaptchasModel({this.code, this.data, this.msg});

  CaptchasModel.fromJson(Map<String, dynamic> json) {
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


//注册成功后的model
class RegisterModel {
  int code;
  String data;
  String msg;

  RegisterModel({this.code, this.data, this.msg});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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

//登录成功后返回的token
class LoginModel {
  int code;
  String data;
  String msg;

  LoginModel({this.code, this.data, this.msg});

  LoginModel.fromJson(Map<String, dynamic> json) {
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

//上传图片 model
class UploadImage {
  int code;
  String data;
  String msg;

  @override
  String toString() {
    return '上传图片 UploadImage{code: $code, data: $data, msg: $msg}';
  }

  UploadImage({this.code, this.data, this.msg});

  UploadImage.fromJson(Map<String, dynamic> json) {
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