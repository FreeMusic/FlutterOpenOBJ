import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chenji_ista_app/res/colors.dart';
import 'package:flutter_chenji_ista_app/res/styles.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/user_about_page.dart';
import 'package:flutter_chenji_ista_app/ui/page/user/user_privacy_page.dart';
import 'package:flutter_chenji_ista_app/ui/widget/base_stateful_widget.dart';

//认证模块
class AttestationPage extends BaseWidget {
  @override
  BaseWidgetState<BaseWidget> getState() {
    // TODO: implement getState
    return _AttestationPageState();
  }
}

class _AttestationPageState extends BaseWidgetState<AttestationPage> {
  @override
  void onCreate() {}

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          '我的认证',
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
                  title: Text("身份认证"),
                  onTap: () {
//                    startAct(AboutPage());
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              DividerH.divider_left20,
              Material(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("公司认证"),
                  onTap: () {
//                    startAct(PrivacyPage());
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              DividerH.divider_left20,
              Material(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("房子认证"),
                  onTap: () {},
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              DividerH.divider_left20,
              Material(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text("车子认证"),
                  onTap: () {},
                  trailing: Icon(Icons.chevron_right),
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
