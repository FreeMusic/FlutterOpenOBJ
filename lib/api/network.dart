//import 'package:dio/dio.dart';
//import 'package:flutter_chenji_ista_app/model/base_bean_entity.dart';
//import 'package:flutter_chenji_ista_app/model/user_bean_entity.dart';
//import 'package:flutter_chenji_ista_app/model/user_center_been_entity.dart';
//
//import 'httputil.dart';
//
///**/
//class NetWork {
//  NetWork();
//
//  NetWork _work;
//
//  NetWork.getInstans() {
//    if (null == _work) {
//      _work = new NetWork();
//    }
//  }
//
//  /*
//  * 请求省份  provinces
//  * */
//  Future<ProvinceModel> Province(
//      Function successCallBack, Function errorCallBack) async {
//    HttpController.getData("provinces", null, (data) {
//      print('请求省份:' + data.toString());
//      ProvinceModel model = ProvinceModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *
//  *  是否已注册      data : 1已注册, 0未注册   users/count/username
//  * */
//  Future<LoginOrRegisterModel> isRegisterUser(
//      phone, Function successCallBack, Function errorCallBack) async {
//    HttpController.postData("users/count/username/$phone", null, (data) {
//      print('是否已注册:' + data.toString());
//      LoginOrRegisterModel model = LoginOrRegisterModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *
//  *  图片验证码  smsCaptchas
//  * */
//  Future<BaseModel> smsCaptchas(Map<String, String> params,
//      Function successCallBack, Function errorCallBack) async {
//    print('图片验证码=====参数>>>' + params.toString());
//    HttpController.postData("smsCaptchas", params, (data) {
//      print('图片验证码=====结果>>>' + data.toString());
//      BaseModel model = BaseModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *
//  *  忘记密码  users/password/update
//  * */
//  Future<RegisterModel> updatePassword(Map<String, String> params,
//      Function successCallBack, Function errorCallBack) async {
//    print('注册===========参数>>>' + params.toString());
//    HttpController.postData("users/password/update", params, (data) {
//      print('注册=============结果>>>' + data.toString());
//      BaseModel model = BaseModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *
//  *  注册  users
//  * */
//  Future<RegisterModel> registerUsers(Map<String, String> params,
//      Function successCallBack, Function errorCallBack) async {
//    print('注册===========参数>>>' + params.toString());
//    HttpController.postData("users", params, (data) {
//      print('注册=============结果>>>' + data.toString());
//      RegisterModel model = RegisterModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *
//  *  登录 users/token
//  * */
//  Future<LoginModel> loginUsers(Map<String, String> params,
//      Function successCallBack, Function errorCallBack) async {
//    print('登录===========参数>>>' + params.toString());
//    HttpController.postData("users/token", params, (data) {
//      print('登录=============结果>>>' + data.toString());
//      LoginModel model = LoginModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *
//  *  图片上传  qiNiuUpload
//  * */
//  Future<UploadImage> qiNiuUpload(FormData formData, Function successCallBack,
//      Function errorCallBack) async {
//    print('上传图片===========参数>>>' + formData.toString());
//    HttpController.postFileData("qiNiuUpload", formData, (data) {
//      print('上传图片=============结果>>>' + data.toString());
//      UploadImage model = UploadImage.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *
//  *  基本信息修改  users/basic/update
//  * */
//  Future<BaseModel> updateUsers(Map<String, String> params,
//      Function successCallBack, Function errorCallBack) async {
//    print('基本信息修改===========参数>>>' + params.toString());
//    HttpController.postData("users/basic/update", params, (data) {
//      print('基本信息修改=============结果>>>' + data.toString());
//      BaseModel model = BaseModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//
//  /*
//  *  xsxxxx
//  * */
//  Future<ProvinceModel> xxxxxxx(Function successCallBack,
//      Map<String, String> params, Function errorCallBack, phone) async {
//    HttpController.postData("users/count/username/$phone", params, (data) {
//      print('请求省份:' + data.toString());
//      ProvinceModel model = ProvinceModel.fromJson(data);
//      successCallBack(model);
//    }, (error) {
//      errorCallBack(error);
//    });
//  }
//}
