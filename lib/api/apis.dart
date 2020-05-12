

class ApiUrls{
  //登陆
  static const String LOGIN="xxxxx/sss/xxx";
  //获取设备列表
  static const String GETDEVICELIST="xxxxx/xxxx";
  //获取绑定列表

  //baseurl

  static const BASEURL = "http://www.api.51chenji.com/";
  static const SmsCaptchas = "smsCaptchas";

  static String getPath({String path: ''}) {
    StringBuffer sb = new StringBuffer(path);
    return sb.toString();
  }
}
