//import 'dart:convert';
//import 'dart:io';
//
//import 'package:cookie_jar/cookie_jar.dart';
//import 'package:dio/dio.dart';
//import 'package:flutter_chenji_ista_app/api/apis.dart';
//import 'package:flutter_chenji_ista_app/config/constant.dart';
//import 'package:flutter_chenji_ista_app/utils/sp_util.dart';
//
//class HttpUtils {
//  static const String FormatUrl = "json";
//
//  static const String GET = 'GET';
//  static const String POST = 'POST';
//  static const int TIMEOUT_CONNECT = 15000;
//  static const int TIMEOUT_RECEIVE = 15000;
//  static const int TIMEOUT_SEND = 15000;
//
//  static getUrl({String article, int index}) {
//    if (index != null) {
//      return ApiUrls.BASEURL + article + "$index/" + FormatUrl;
//    } else {
//      return ApiUrls.BASEURL + article + FormatUrl;
//    }
//  }
//}
//
//class HttpController {
//  /**
//   * get 请求
//   */
//  static getData(String url, Map<String, String> params,
//      Function successCallback, Function errorCallBack) async {
//    print(
//        "=============>>>>>>>>>>>>>>>>  Get请求  =============>>>>>>>>>>>>>>>>参数： " +
//            params.toString());
//    print(
//        "=============>>>>>>>>>>>>>>>>  Get请求  =============>>>>>>>>>>>>>>>>参数： " +
//            successCallback.toString());
//
//    if (params != null && params.isNotEmpty) {
//      StringBuffer stringBuffer = new StringBuffer("?");
//      params.forEach((key, value) {
//        stringBuffer.write("$key" + "=" + "$value" + "&");
//      });
//      String paramStr = stringBuffer.toString();
//      paramStr = paramStr.substring(0, paramStr.length - 1);
//      url += paramStr;
//    }
//    _request(ApiUrls.BASEURL + url, successCallback,
//        method: HttpUtils.GET, params: params, errorCallBack: errorCallBack);
//  }
//
//  /**
//   * Post请求
//   */
//  static postData(String url, Map<String, String> params,
//      Function successCallback, Function errorCallBack) async {
//    print(
//        "=============>>>>>>>>>>>>>>>>  Post请求  =============>>>>>>>>>>>>>>>>参数： " +
//            params.toString());
//    print(
//        "=============>>>>>>>>>>>>>>>>  Post请求  =============>>>>>>>>>>>>>>>>参数： " +
//            successCallback.toString());
//
//    _request(ApiUrls.BASEURL + url, successCallback,
//        method: HttpUtils.POST, params: params, errorCallBack: errorCallBack);
//  }
//
//  /**
//   * Post File请求
//   */
//  static postFileData(String url, FormData formData ,
//      Function successCallback, Function errorCallBack) async {
//    print(
//        "=============>>>>>>>>>>>>>>>>  Post请求  =============>>>>>>>>>>>>>>>>参数： " +
//            formData.toString());
//    print(
//        "=============>>>>>>>>>>>>>>>>  Post请求  =============>>>>>>>>>>>>>>>>参数： " +
//            successCallback.toString());
//
//    _requestFile(ApiUrls.BASEURL + url, successCallback,
//        method: HttpUtils.POST, formData: formData, errorCallBack: errorCallBack);
//  }
//
//  /*
//  * 网络请求
//  * */
//  static void _request(String url, Function successCallback,
//      {String method,
//      Map<String, String> params,
//      Function errorCallBack}) async {
//    print("网络请求  url =  $url");
//    String errorMsg = "";
//    int statusCode;
//    try {
//      Response response;
//      BaseOptions baseOptions = new BaseOptions(
//        connectTimeout: HttpUtils.TIMEOUT_CONNECT,
//        receiveTimeout: HttpUtils.TIMEOUT_RECEIVE,
//        responseType: ResponseType.plain,
////        contentType: ContentType.binary,
//        //请求头
//        headers: {
//          "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
//          "_token": SpUtil.getString(Constant.keyUserToken)
//        },
//      );
//      // dio库中默认将请求数据序列化为json，此处可根据后台情况自行修改
////      contentType:new ContentType('application', 'x-www-form-urlencoded',charset: 'utf-8')
//      Options options = new Options(
//        connectTimeout: HttpUtils.TIMEOUT_CONNECT,
//        receiveTimeout: HttpUtils.TIMEOUT_RECEIVE,
//        sendTimeout: HttpUtils.TIMEOUT_SEND,
//      );
//      Dio dio = new Dio(baseOptions);
////      ------------------Cookie管理
//      dio.interceptors.add(CookieManager(CookieJar()));
//
////      ------------------拦截器
//
//      if (method == HttpUtils.GET) {
//        response =
//            await dio.get(url, queryParameters: params, options: options);
//      } else {
//        response =
//            await dio.post(url, queryParameters: params, options: options);
//      }
//      statusCode = response.statusCode;
//      if (statusCode != HttpStatus.ok) {
//        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
//        _handError(errorCallBack, errorMsg);
//      } else {
//        if (successCallback != null) {
//          print(response);
//          var data = json.decode(response.toString()); //对数据进行Json转化
//          successCallback(data);
//        }
//      }
//
//      print("Dio response : =====================================");
//      print("Dio response data: " + response.data.toString());
//      print("Dio response headers: " + response.headers.toString());
//      print("Dio response request: " + response.request.toString());
//      print("Dio response redirects: " + response.redirects.toString());
//      print("Dio response statusCode: " + response.statusCode.toString());
//      print("Dio response statusMessage: " + response.statusMessage.toString());
//      print("Dio response extra: " + response.extra.toString());
//      print("Dio response : =====================================");
//    } catch (exception) {
//      _handError(errorCallBack, exception.toString());
//    }
//  }
//
//  /*
//  * 网络请求
//  * */
//  static void _requestFile(String url, Function successCallback,
//      {String method,
//        FormData formData,
//      Function errorCallBack}) async {
//    print("网络请求  url =  $url");
//    String errorMsg = "";
//    int statusCode;
//    try {
//      Response response;
//      BaseOptions baseOptions = new BaseOptions(
//        connectTimeout: HttpUtils.TIMEOUT_CONNECT,
//        receiveTimeout: HttpUtils.TIMEOUT_RECEIVE,
//        responseType: ResponseType.plain,
////        contentType: ContentType.binary,
//        //请求头
//        headers: {
//          "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
//          "_token": SpUtil.getString(Constant.keyUserToken)
//        },
//      );
//      // dio库中默认将请求数据序列化为json，此处可根据后台情况自行修改
////      contentType:new ContentType('application', 'x-www-form-urlencoded',charset: 'utf-8')
//      Options options = new Options(
//        connectTimeout: HttpUtils.TIMEOUT_CONNECT,
//        receiveTimeout: HttpUtils.TIMEOUT_RECEIVE,
//        sendTimeout: HttpUtils.TIMEOUT_SEND,
//      );
//      Dio dio = new Dio(baseOptions);
////      ------------------Cookie管理
//      dio.interceptors.add(CookieManager(CookieJar()));
//
//      response = await dio.post(url, data: formData, options: options);
//
//      statusCode = response.statusCode;
//      if (statusCode != HttpStatus.ok) {
//        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
//        _handError(errorCallBack, errorMsg);
//      } else {
//        if (successCallback != null) {
//          print(response);
//          var data = json.decode(response.toString()); //对数据进行Json转化
//          successCallback(data);
//        }
//      }
//
//      print("Dio response : =====================================");
//      print("Dio response data: " + response.data.toString());
//      print("Dio response headers: " + response.headers.toString());
//      print("Dio response request: " + response.request.toString());
//      print("Dio response redirects: " + response.redirects.toString());
//      print("Dio response statusCode: " + response.statusCode.toString());
//      print("Dio response statusMessage: " + response.statusMessage.toString());
//      print("Dio response extra: " + response.extra.toString());
//      print("Dio response : =====================================");
//    } catch (exception) {
//      _handError(errorCallBack, exception.toString());
//    }
//  }
//
//  /**
//   * 异常处理
//   */
//  static void _handError(Function errorCallback, String errorMsg) {
//    if (errorCallback != null) {
//      errorCallback(errorMsg);
//    }
//  }
//}
