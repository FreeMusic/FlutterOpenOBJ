import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chenji_ista_app/api/network.dart';
import 'package:flutter_chenji_ista_app/config/constant.dart';
import 'package:flutter_chenji_ista_app/model/base_bean_entity.dart';
import 'package:flutter_chenji_ista_app/model/user_bean_entity.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';
import 'package:flutter_chenji_ista_app/ui/widget/edit_textview.dart';
import 'package:flutter_chenji_ista_app/utils/header_index.dart';
import 'package:flutter_chenji_ista_app/utils/log_util.dart';
import 'package:flutter_chenji_ista_app/utils/refresh_normal_header.dart';
import 'package:flutter_chenji_ista_app/utils/sp_util.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jd_address_selector/jd_address_selector.dart';

class UserInfoPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    return _UserInfoPageState();
  }
}

class _UserInfoPageState extends BaseWidgetState<UserInfoPage> {
//  学历 集合
  List educationList = [
    "初中",
    "高中",
    "大专",
    "本科",
    "硕士",
    "博士",
  ];

//  收入集合
  List incomeList = [
    "5W以下",
    "5W-10W",
    "10W-20W",
    "20W-30W",
    "30W-40W",
    "40W-50W",
    "50W+",
    "100W+",
    "200W+",
    "300W+",
    "400W+",
    "500W+",
  ];

//  星座集合
  List constellationList = [
    "白羊座",
    "金牛座",
    "双子座",
    "巨蟹座",
    "狮子座",
    "处女座",
    "天秤座",
    "天蝎座",
    "射手座",
    "摩羯座",
    "水瓶座",
    "双鱼座",
  ];

  TextEditingController _controller_Nicename = new TextEditingController();
  TextEditingController _controller_Wxnumber = new TextEditingController();
  TextEditingController _controller_Work = new TextEditingController();
  TextEditingController _controller_Company = new TextEditingController();
  TextEditingController _controller_mother_job = new TextEditingController();
  TextEditingController _controller_father_job = new TextEditingController();

  String _province = '';
  String _city = '';
  String _area = '';
  String _address = "未设置"; //居住地

  String _provinceOld = '';
  String _cityOld = '';
  String _areaOld = '';
  String _addressOld = "未设置"; //家乡

  String _constellationStr = "未设置"; //星座
  String _educationStr = "未设置"; //学历
  String _incomeStr = "未设置"; //收入
  String _heightStr = "未设置"; //收入
  String _ageStr = "未设置"; //年龄

  String _nicenameStr = ""; //昵称
  String _wxnumberStr = ""; //微信号
  String _companyStr = ""; //公司
  String userlogoUrl = ""; //头像地址
  String _myJobStr = ""; //工作
  String _motherJobStr = ""; //工作
  String _fatherJobStr = ""; //工作

  @override
  void onCreate() {
    userlogoUrl = SpUtil.getString(Constant.userlogoUrl);

    _controller_Nicename.addListener(() {
      _nicenameStr = _controller_Nicename.text;
      print("====昵称 输入框 监听  " + _nicenameStr);
    });

    _controller_Wxnumber.addListener(() {
      _wxnumberStr = _controller_Wxnumber.text;
      print("====微信号 输入框 监听  " + _wxnumberStr);
    });

    _controller_Work.addListener(() {
      _myJobStr = _controller_Work.text;
      print("====工作 输入框 监听  " + _myJobStr);
    });

    _controller_Company.addListener(() {
      _companyStr = _controller_Company.text;
      print("====公司 输入框 监听  " + _companyStr);
    });

    _controller_mother_job.addListener(() {
      _motherJobStr = _controller_mother_job.text;
      print("====母亲工作  输入框 监听  " + _motherJobStr);
    });

    _controller_father_job.addListener(() {
      _fatherJobStr = _controller_father_job.text;
      print("====父亲工作  输入框 监听  " + _fatherJobStr);
    });
  }

  @override
  void onDestroy() {}

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Colours.white,
          title: Text(
            "个人资料",
            style: TextStyle(color: Colours.gray_33),
          ),
          centerTitle: true,
          actions: <Widget>[
            Center(
              child: FlatButton(
                child:
                    Text("完成     ", style: TextStyle(color: Colours.gray_33)),
                onPressed: () {
                  _postUserInfo();
                },
              ),
            ),
          ],
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colours.gray_33,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: EasyRefresh.custom(
            header: NormalHeader(),
            footer: NormalFooter(),
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            DecoratedBox(
                              child: Container(
                                width: 5,
                                height: 25,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colours.test_color3,
                              ),
                            ),
                            Gaps.hGap10,
                            Text(
                              "个人信息",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                      ),

                      //头像
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "头像",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                showPhoto();
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Image.network(
                                  userlogoUrl,
                                  width: 55,
                                  height: 55,
                                ),
                              ),
                            )),
                            Gaps.hGap5,
                            Offstage(
                              offstage: true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 20, right: 15, bottom: 10),
                      ),
                      DividerH.divider_left20,

                      //昵称
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "昵称",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Flexible(
                              child: Container(
                                child: DefultTextField(
                                  textInputType: TextInputType.text,
                                  controller: _controller_Nicename,
                                  hintText: "请输入您的昵称",
                                ),
                                margin: EdgeInsets.only(left: 50),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,
                      //微信
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "微信号",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Flexible(
                              child: Container(
                                child: DefultTextField(
                                  textInputType: TextInputType.text,
                                  controller: _controller_Wxnumber,
                                  hintText: "请输入您的微信号",
                                ),
                                margin: EdgeInsets.only(left: 50),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //星座
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "星座",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    _constellationStr,
                                    style: TextStyle(
                                        color: _constellationStr != "未设置"
                                            ? Colours.gray_33
                                            : Colours.gray_99),
                                  ),
                                  onPressed: () {
                                    print("点击事件---星座");
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                              title: Text('请选择您的星座'),
                                              content: SizedBox(
                                                height: 200.0,
                                                child: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: item_content(
                                                        context,
                                                        0,
                                                        constellationList),
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                CupertinoDialogAction(
                                                  child: Text("取消"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    print("取消");
                                                  },
                                                  isDestructiveAction: true,
                                                ),
                                              ],
                                            ));
                                  },
                                ),
                              ),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage:
                                  _constellationStr != "未设置" ? false : true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //年龄
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "年龄",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    _ageStr,
                                    style: TextStyle(
                                        color: _ageStr != "未设置"
                                            ? Colours.gray_33
                                            : Colours.gray_99),
                                  ),
                                  onPressed: () {
                                    print("点击事件---年龄");
                                    List contentList = [];
                                    contentList.add("18岁 以下");
                                    for (int i = 18; i < 70; i++) {
                                      contentList.add("$i");
                                    }
                                    contentList.add("70岁 以上");
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                              title: Text('请选择您的年龄'),
                                              content: SizedBox(
                                                height: 200.0,
                                                child: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: item_content(
                                                        context,
                                                        4,
                                                        contentList),
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                CupertinoDialogAction(
                                                  child: Text("取消"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    print("取消");
                                                  },
                                                  isDestructiveAction: true,
                                                ),
                                              ],
                                            ));
                                  },
                                ),
                              ),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: _ageStr != "未设置" ? false : true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,
                      //身高
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "身高",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    _heightStr,
                                    style: TextStyle(
                                        color: _heightStr != "未设置"
                                            ? Colours.gray_33
                                            : Colours.gray_99),
                                  ),
                                  onPressed: () {
                                    print("点击事件---身高");
                                    List contentList = [];
                                    contentList.add("150 cm 以下");
                                    for (int i = 150; i < 210; i++) {
                                      contentList.add("$i cm");
                                    }
                                    contentList.add("210 cm 以上");
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                              title: Text('请选择您的身高'),
                                              content: SizedBox(
                                                height: 200.0,
                                                child: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: item_content(
                                                        context,
                                                        3,
                                                        contentList),
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                CupertinoDialogAction(
                                                  child: Text("取消"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    print("取消");
                                                  },
                                                  isDestructiveAction: true,
                                                ),
                                              ],
                                            ));
                                  },
                                ),
                              ),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: _heightStr != "未设置" ? false : true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //学历
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "学历",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    _educationStr,
                                    style: TextStyle(
                                        color: _educationStr != "未设置"
                                            ? Colours.gray_33
                                            : Colours.gray_99),
                                  ),
                                  onPressed: () {
                                    print("点击事件---学历");
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                              title: Text('请选择您的学历'),
                                              content: SizedBox(
                                                height: 200.0,
                                                child: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: item_content(
                                                        context,
                                                        1,
                                                        educationList),
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                CupertinoDialogAction(
                                                  child: Text("取消"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    print("取消");
                                                  },
                                                  isDestructiveAction: true,
                                                ),
                                              ],
                                            ));
                                  },
                                ),
                              ),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: _educationStr != "未设置" ? false : true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,
                      //年收入
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "年收入",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    _incomeStr,
                                    style: TextStyle(
                                        color: _incomeStr != "未设置"
                                            ? Colours.gray_33
                                            : Colours.gray_99),
                                  ),
                                  onPressed: () {
                                    print("点击事件---收入");
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                              title: Text('请选择您的年收入'),
                                              content: SizedBox(
                                                height: 200.0,
                                                child: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: item_content(
                                                        context, 2, incomeList),
                                                  ),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                CupertinoDialogAction(
                                                  child: Text("取消"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    print("取消");
                                                  },
                                                  isDestructiveAction: true,
                                                ),
                                              ],
                                            ));
                                  },
                                ),
                              ),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: _incomeStr != "未设置" ? false : true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //职业
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "职业",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Flexible(
                              child: Container(
                                child: DefultTextField(
//                            textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  controller: _controller_Work,
                                  hintText: "请输入您的职业",
                                ),
                                margin: EdgeInsets.only(left: 50),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //公司
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "公司",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Flexible(
                              child: Container(
                                child: DefultTextField(
                                  textInputType: TextInputType.text,
                                  controller: _controller_Company,
                                  hintText: "请输入您的公司",
                                ),
                                margin: EdgeInsets.only(left: 50),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //母亲职业
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "母亲职业",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Flexible(
                              child: Container(
                                child: DefultTextField(
                                  textInputType: TextInputType.text,
                                  controller: _controller_mother_job,
                                  hintText: "请输入您的母亲职业",
                                ),
                                margin: EdgeInsets.only(left: 50),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //父亲职业
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "父亲职业",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Flexible(
                              child: Container(
                                child: DefultTextField(
                                  textInputType: TextInputType.text,
                                  controller: _controller_father_job,
                                  hintText: "请输入您的父亲职业",
                                ),
                                margin: EdgeInsets.only(left: 50),
                              ),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 20, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //家乡
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "家乡",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    _addressOld,
                                    style: TextStyle(
                                        color: _addressOld != "未设置"
                                            ? Colours.gray_33
                                            : Colours.gray_99),
                                  ),
                                  onPressed: () {
                                    _choiceArea(1);
                                  },
                                ),
                              ),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: _addressOld != "未设置" ? false : true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,
                      //居住地
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "居住地",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  child: Text(
                                    _address,
                                    style: TextStyle(
                                        color: _address != "未设置"
                                            ? Colours.gray_33
                                            : Colours.gray_99),
                                  ),
                                  onPressed: () {
                                    _choiceArea(2);
                                  },
                                ),
                              ),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: _address != "未设置" ? false : true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      Container(
                        color: Colours.app_bg,
                        height: 10,
                      ),
                      //其它
                      Container(
                        child: Row(
                          children: <Widget>[
                            DecoratedBox(
                              child: Container(
                                width: 5,
                                height: 25,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colours.test_color3,
                              ),
                            ),
                            Gaps.hGap10,
                            Text(
                              "其它",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                      ),
                      //标签
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "标签",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              "未设置",
                              style: TextStyle(color: Colours.gray_99),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 20, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,

                      //价值观
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "价值观",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              "未设置",
                              style: TextStyle(color: Colours.gray_99),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,
                      //价值观
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "更多回答",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              "未设置",
                              style: TextStyle(color: Colours.gray_99),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,
                      //价值观
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "匿名回答",
                              style: TextStyle(color: Colours.gray_33),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              "未设置",
                              style: TextStyle(color: Colours.gray_99),
                            ),
                            Gaps.hGap5,
                            Offstage(
                              offstage: true,
                              child: Icon(Icons.chevron_right),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(
                            left: 20, top: 10, right: 15, bottom: 5),
                        height: 45,
                      ),
                      DividerH.divider_left20,
                      Gaps.vGap30
                    ],
                  ),
                ]),
              )
            ],
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2), () {
                setState(() {});
              });
            },
          ),
        ));
  }

//  选择地址 index 1 家乡  2居住地
  void _choiceArea(index) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return JDAddressDialog(
              onSelected: (province, city, county) {
                setState(() {
                  if (index == 1) {
                    _provinceOld = province;
                    _cityOld = city;
                    _areaOld = county;
                    _addressOld = '$province $city $county';
                  } else if (index == 2) {
                    _province = province;
                    _city = city;
                    _area = county;
                    _address = '$province $city $county';
                  }
                });
              },
              title: '选择地区',
              unselectedColor: Colours.gray_33);
        });
  }

//  index  0 星座  1 学历   2 年收入  3 身高  4 年龄
  List<Widget> item_content(context, int indexContent, List list) {
    List contentList = list;
    List<Widget> widgets = [];
    print("子view 选择   $indexContent");
    for (int i = 0; i < contentList.length; i++) {
      CupertinoDialogAction action = CupertinoDialogAction(
        child: Text(contentList[i]),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            if (indexContent == 0) {
              _constellationStr = contentList[i];
            } else if (indexContent == 1) {
              _educationStr = contentList[i];
            } else if (indexContent == 2) {
              _incomeStr = contentList[i];
            } else if (indexContent == 3) {
              _heightStr = contentList[i];
            } else if (indexContent == 4) {
              _ageStr = contentList[i];
            }
            print("点击  " + contentList[i]);
          });
        },
      );
      widgets.add(action);
//      widgets.add(DividerH.divider);
    }
    return widgets;
  }

  void showPhoto() {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (context) => CupertinoActionSheet(
                actions: <Widget>[
                  CupertinoActionSheetAction(
                    child: const Text('相册'),
                    onPressed: () {
                      Navigator.pop(context);
                      _onImageButtonPressed(ImageSource.gallery);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('拍照'),
                    onPressed: () {
                      Navigator.pop(context);
                      _onImageButtonPressed(ImageSource.camera);
                    },
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: const Text('取消'),
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )));
  }

  File imageFile;

  Future<Null> _onImageButtonPressed(ImageSource source) async {
    imageFile = await ImagePicker.pickImage(source: source);

    if (imageFile != null) {
      setState(() {
        _cropImage();
      });
    }
  }

//  裁剪图片
  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      toolbarTitle: '裁剪图片',
      toolbarColor: Colours.button_color_start,
      toolbarWidgetColor: Colors.white,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );
    if (croppedFile != null) {
      imageFile = croppedFile;
      print("====_cropImage>>>" + imageFile.path);
      _upLoadImage(imageFile);
    }
  }

//  上传图片
  _upLoadImage(File image) async {
    String path = image.path;
    var name = path.substring(path.lastIndexOf("/") + 1, path.length);
    var suffix = name.substring(name.lastIndexOf(".") + 1, name.length);
    FormData formData = new FormData.from({
      "_token": SpUtil.getString(Constant.keyUserToken),
      "file": new UploadFileInfo(new File(path), name,
          contentType: ContentType.parse("image/$suffix"))
    });

    NetWork.getInstans().qiNiuUpload(formData, (UploadImage model) {
      LogUtil.e("=======>>>  " + model.toString());
      if (model.code == 0) {
        setState(() {
          SpUtil.putString(Constant.userlogoUrl, model.data);
          userlogoUrl = SpUtil.getString(Constant.userlogoUrl);
          LogUtil.e("返回的头像 地址  =======>>>  $userlogoUrl");
        });
      } else {
        showToast(model.msg);
      }
    }, (error) {
      showToast(error);
    });
  }

  void _postUserInfo() {
//    province : 居住省,
//    city : 居住市,
//    area : 居住区,
//    address : 可空, 居住详细地址,

//    provinceOld : 户籍省,
//    cityOld : 户籍市,
//    areaOld : 户籍区,
//    addressOld : 可空, 户籍详细地址,

//    job : 职业,
//    education : 学历,
//    income : 收入,
//    horoscope : 星座,
//    wechat : 首次必填, 微信,
//    height : 身高, 单位公分

//    jobFather : 父亲职业,
//    jobMother : 母亲职业,

//昵称、身高、公司、年龄、

    Map<String, String> params = {
      "province":_province,
      "city":_city,
      "area":_area,
      "address":_address,
      "provinceOld":_provinceOld,
      "cityOld":_cityOld,
      "areaOld":_areaOld,
      "addressOld":_addressOld,
      "job":_myJobStr,
      "education":_educationStr,
      "income":_incomeStr,
      "horoscope":_constellationStr,
      "wechat":_wxnumberStr,
      "height":_heightStr,
      "jobFather":_fatherJobStr,
      "jobMother":_motherJobStr,
    };

    NetWork.getInstans().updateUsers(params, (BaseModel model) {
      LogUtil.e("=======>>>  " + model.toString());
      if (model.code == 0) {

      } else {
        showToast(model.msg);
      }
    }, (error) {
      showToast(error);
    });
  }
}
