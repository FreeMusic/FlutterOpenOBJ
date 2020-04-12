import 'dart:math';

class Ids {
  static const String tab_main_home = '首页';
  static const String tab_main_home_recommend = '推荐';
  static const String tab_main_home_square = '广场';
  static const String tab_main_home_story = '脱单故事';
  static const String tab_main_message = '消息';
  static const String tab_main_user = '我的';
}

class Strings {

  static String getRandom() {
    String alphabet =
        'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890';
    int strlenght = 30;

    /// 生成的字符串固定长度
    String left = '';
    for (var i = 0; i < strlenght; i++) {
//    right = right + (min + (Random().nextInt(max - min))).toString();
      left = left + alphabet[Random().nextInt(alphabet.length)];
    }
    return left;
  }

  static bool isPhone(String phoneText){
    RegExp exp = RegExp(
        r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    bool matched = exp.hasMatch(phoneText);
    return matched;
  }

}
