import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';

//隐私模块
class PrivacyPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    // TODO: implement getState
    return _PrivacyPageState();
  }
}

class _PrivacyPageState extends BaseWidgetState<PrivacyPage> {
  bool isSwitch=true;

  @override
  void onCreate() {}

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          '隐私设置',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colours.gray_33,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
                child: Container(
                  color: Colours.transparent,
                ),
              ),
              Material(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("屏蔽用户列表"),
                  onTap: () async {},
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              DividerH.divider_left20,
              Material(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("信息是否上架"),
                  onTap: () async {},
                  trailing:CupertinoSwitch(
                      activeColor: Theme.of(context).accentColor,
                      value: isSwitch,
                      onChanged: (value) {
                        setState(() {
                          isSwitch=!isSwitch;
                        });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDestroy() {}
}
