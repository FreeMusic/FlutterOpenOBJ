import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageHelper {
  static const String baseUrl = 'http://www.meetingplus.cn';
  static const String imagePrefix = '$baseUrl/uimg/';
  static const String userlogo =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1568165672&di=f5ea43bdbb901caf22baa2d8b5385462&src=http://cms-bucket.nosdn.127.net/2018/09/14/6b6ccb3c2cdf48dba8e7b896fef40a6e.jpeg?imageView&thumbnail=550x0";

  static String wrapUrl(String url) {
    if (url.startsWith('http')) {
      return url;
    } else {}
    return imagePrefix + url;
  }

  static String wrapAssets(String url) {
    return "assets/images/" + url;
  }

  static String homeAssets(String url) {
    return "assets/images/home_images/" + url;
  }

  static String userAssets(String url) {
    return "assets/images/user_images/" + url;
  }

  static String tabbarAssets(String url) {
    return "assets/images/tabbar_images/" + url;
  }

  static Image homeImage(String url) {
    return Image.asset(ImageHelper.homeAssets(url));
  }

  static Image tabbarImage(String url) {
    return Image.asset(ImageHelper.tabbarAssets(url));
  }

  static String messageAssets(String url) {
    return "assets/images/message_images/" + url;
  }

  static Image iconBase(String url) {
    return Image.asset(ImageHelper.wrapAssets(url));
  }

  static Image iconUser(String url) {
    return Image.asset(ImageHelper.userAssets(url));
  }

  static Widget placeHolder({double width, double height}) {
    return SizedBox(
        width: width,
        height: height,
        child: CupertinoActivityIndicator(radius: min(10.0, width / 3)));
  }

  static Widget error({double width, double height, double size}) {
    return SizedBox(
        width: width,
        height: height,
        child: Icon(
          Icons.error_outline,
          size: size,
        ));
  }

  static String randomUrl(
      {int width = 100, int height = 100, Object key = ''}) {
    return 'http://placeimg.com/$width/$height/${key.hashCode.toString() + key.toString()}';
  }
}

class IconFonts {
  IconFonts._();

  static const String fontFamily = 'iconfont';

  static const IconData pageEmpty = IconData(0xe63c, fontFamily: fontFamily);
  static const IconData pageError = IconData(0xe600, fontFamily: fontFamily);
  static const IconData pageUnAuthorized =
      IconData(0xe65f, fontFamily: fontFamily);
  static const IconData train = IconData(0xe89a, fontFamily: fontFamily);
  static const IconData hotel = IconData(0xe8a0, fontFamily: fontFamily);
}

/*
* Tabbar图标
* */
class TabbarIcons {
  static const String tabbar_home_selected = "tabbar_home_selected.png";
  static const String tabbar_home_unselected = "tabbar_home_unselected.png";
  static const String tabbar_message_selected = "tabbar_message_selected.png";
  static const String tabbar_message_unselected =
      "tabbar_message_unselected.png";
  static const String tabbar_usercenter_selected =
      "tabbar_usercenter_selected.png";
  static const String tabbar_usercenter_unselected =
      "tabbar_usercenter_unselected.png";
}

/*
* 首页图标
* */
class HomeIcons {
  static String love = "home_page_love.png";
  static String age = "home_page_age.png";
  static String area = "home_page_area.png";
  static String car = "home_page_car.png";
  static String company = "home_page_company.png";
  static String constellation = "home_page_constellation.png";
  static String education = "home_page_education.png";
  static String eye = "home_page_eye.png";
  static String height = "home_page_height.png";
  static String hometown = "home_page_hometown.png";
  static String house = "home_page_house.png";
  static String income = "home_page_income.png";
  static String isVip = "home_page_isVip.png";
  static String job = "home_page_job.png";
  static String name = "home_page_name.png";
  static String man = "home_page_man.png";
  static String showmore = "home_page_showmore.png";
  static String woman = "home_page_woman.png";
  static String send = "home_page_send.png";
  static String recive = "home_page_recive.png";
  static const String roundsend = "home_page_roundsend.png";
  static const String roundrecive = "home_page_roundrecive.png";
  static String bursting = ImageHelper.homeAssets("home_page_bursting.png");
  static const String location = "home_page_location.png";
  static const String more = "home_page_more.png";
  static const String tt = "home_page_tt.png";
  static String praise = ImageHelper.homeAssets("home_page_praise.png");
  static String share = ImageHelper.homeAssets("home_page_share.png");
  static String comments = ImageHelper.homeAssets("home_page_comments.png");
  static String search = ImageHelper.homeAssets("home_page_search.png");
  static String ask = ImageHelper.homeAssets("home_page_ask.png");
  static String report = ImageHelper.homeAssets("home_page_report.png");
  static String shield = ImageHelper.homeAssets("home_page_shield.png");
}

/*
* 消息中心图标
* */
class MessageIcons {
  static String ask = ImageHelper.messageAssets("message_ask.png");
  static String guide = ImageHelper.messageAssets("message_guide.png");
  static String notifi = ImageHelper.messageAssets("message_notifi.png");
  static String questions = ImageHelper.messageAssets("message_questions.png");
  static String eye = ImageHelper.messageAssets("message_eye.png");
  static String give = ImageHelper.messageAssets("message_give.png");
  static String recommend = ImageHelper.messageAssets("message_recommend.png");
  static String wechat = ImageHelper.messageAssets("message_wechat.png");
  static String round = ImageHelper.messageAssets("message_round.png");
  static String currentIndex =
      ImageHelper.messageAssets("message_currentIndex.png");
  static String topic = ImageHelper.messageAssets("message_topic.png");
  static String fill = ImageHelper.messageAssets("message_round_fill.png");
  static String faile = ImageHelper.messageAssets("message_see_faile.png");
  static String success = ImageHelper.messageAssets("message_see_success.png");
  static String eyetoeye = ImageHelper.messageAssets("message_eyetoeye.png");
  static String close = ImageHelper.messageAssets("message_close.png");
  static String sendlove = ImageHelper.messageAssets("message_send_love.png");
  static String circle = ImageHelper.messageAssets("message_circle.png");
  static String wholeheart =
      ImageHelper.messageAssets("message_whole_heart.png");
  static String bokenheart =
      ImageHelper.messageAssets("messge_boken_heart.png");
  static String header = ImageHelper.messageAssets("message_header.png");
}

class UserIcons {
  static const String login_or_register_goleft =
      "icon_login_or_register_goleft.png";
  static const String login_or_register_left_love =
      "icon_login_or_register_left_love.png";
  static const String icon_user_vip_center = "icon_user_vip_center.png";
  static const String icon_user_sign_in = "icon_user_sign_in.png";
  static const String icon_user_pay = "icon_user_pay.png";
  static const String icon_user_wand = "icon_user_wand.png";
  static const String icon_user_friend = "icon_user_friend.png";
}

class BaseIcons {
  static const String icon_user_vip_un = "icon_user_vip_un.png";
  static const String icon_user_vip_on = "icon_user_vip_on.png";
}
