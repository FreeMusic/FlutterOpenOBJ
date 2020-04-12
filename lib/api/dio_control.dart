import 'package:flutter/cupertino.dart';
import 'package:flutter_chenji_ista_app/api/apis.dart';
import 'package:flutter_chenji_ista_app/api/base_resp.dart';
import 'package:flutter_chenji_ista_app/api/dio_util.dart';
import 'package:flutter_chenji_ista_app/model/user_bean_entity.dart';

class DioModelControl {
  DioModelControl();

  DioModelControl _dioModelControl;

  DioModelControl.getInstans() {
    if (null == _dioModelControl) {
      _dioModelControl = new DioModelControl();
    }
  }

//  用户是否已注册
  Future<LoginOrRegisterModel> IsRegister(phone,
      {Function printError, BuildContext context}) async {
    BaseResp<Map<String, dynamic>> baseResp =
        await DioUtil().request<Map<String, dynamic>>(
      Method.post,
      ApiUrls.getPath(path: "users/count/username/$phone"),
    );
    LoginOrRegisterModel isRegisterEntity;
    if (baseResp.code == 200 || baseResp.code == 201 || baseResp.code == 204) {
      if (baseResp.data != null) {
        isRegisterEntity = LoginOrRegisterModel.fromJson(baseResp.data);
      }
      return isRegisterEntity;
    }
  }

  Future<CaptchasModel> captchas(
      {Function printError, BuildContext context}) async {
    BaseResp<Map<String, dynamic>> baseResp =
        await DioUtil().request<Map<String, dynamic>>(
      Method.get,
      ApiUrls.getPath(path: "captchas"),
    );
    CaptchasModel captchas;
    if (baseResp.code == 200 || baseResp.code == 201 || baseResp.code == 204) {
      if (baseResp.data != null) {
        captchas = CaptchasModel.fromJson(baseResp.data);
      }
      return captchas;
    }
  }
}
