
flutter之Flexible，Expanded,Spacer

Flexible，Expanded,Spacer这三个小控件用于Row, Column, or Flex这三个容器；

Spacer
顾名思义只是一个间距控件，可以用于调节小部件之间的间距，它有一个flex可以进行设置；

Expanded
Expanded会尽可能的充满分布在Row, Column, or Flex的主轴方向上；

Flexible
Flexible也是为小部件提供空间的，但是不会要求子空间填满可用空间；


TextField
Flutter中的文本输入框（TextField）就类似于Android中的EditText，但是用起来比EditText方便很多，改变样式也更加的方便。下面我们来看一下TextField的构造方法

构造方法
const TextField({
    Key key,
    this.controller,    //编辑框的控制器，跟文本框的交互一般都通过该属性完成，如果不创建的话默认会自动创建
    this.focusNode,  //用于管理焦点
    this.decoration = const InputDecoration(),   //输入框的装饰器，用来修改外观
    TextInputType keyboardType,   //设置输入类型，不同的输入类型键盘不一样
    this.textInputAction,   //用于控制键盘动作（一般位于右下角，默认是完成）
    this.textCapitalization = TextCapitalization.none,
    this.style,    //输入的文本样式
    this.textAlign = TextAlign.start,   //输入的文本位置
    this.textDirection,    //输入的文字排列方向，一般不会修改这个属性
    this.autofocus = false,   //是否自动获取焦点
    this.obscureText = false,   //是否隐藏输入的文字，一般用在密码输入框中
    this.autocorrect = true,   //是否自动校验
    this.maxLines = 1,   //最大行
    this.maxLength,   //能输入的最大字符个数
    this.maxLengthEnforced = true,  //配合maxLength一起使用，在达到最大长度时是否阻止输入
    this.onChanged,  //输入文本发生变化时的回调
    this.onEditingComplete,   //点击键盘完成按钮时触发的回调，该回调没有参数，(){}
    this.onSubmitted,  //同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}
    this.inputFormatters,   //对输入文本的校验
    this.enabled,    //输入框是否可用
    this.cursorWidth = 2.0,  //光标的宽度
    this.cursorRadius,  //光标的圆角
    this.cursorColor,  //光标的颜色
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.down,
    this.enableInteractiveSelection,
    this.onTap,    //点击输入框时的回调(){}
    this.buildCounter,
  })
————————————————
版权声明：本文为CSDN博主「喻志强」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://yuzhiqiang.blog.csdn.net/article/details/88204031
TextField(
              controller: controller,
              //允许输入的最大长度，一个字母一个符号一个汉字都算1 且右下角有字数显示
              maxLength: 20,
              //超过最大长度后是否还允许继续输入
//              maxLengthEnforced: true,//默认true  超过长度后输入无效  右下角数字 显示10/10   此时onchange方法依然会调用，返回值就是限制了长度的值 超过后的输入不显示
              maxLengthEnforced: false, //超过后可继续输入  右下角数字显示，比如 23/10

              //不是允许输入的最大行数,指的是输入框内可显示的高度是几行，超过设定行数后，scroll滚动显示
              maxLines: 3,
              //是否自动更正
              autocorrect: true,
              // 该输入框的焦点处理，当获取/失去焦点时回调方法
              focusNode: _focusNode,
              //是否自动获取焦点  跳转到该页面后 光标自动显示到该输入框  键盘弹起
              autofocus: true,
              //是否是密码  非密码以明文显示，密码以点显示
              obscureText: false,

              //文本对齐方式  输入文字后，文字显示时是靠左靠右还是居中
              textAlign: TextAlign.right, // 靠右  textDirection的设置无效
//              textAlign: TextAlign.left,// 靠左   textDirection的设置无效
//              textAlign: TextAlign.center,// 居中
//              textAlign: TextAlign.start,// TextDirection.ltr时靠左，TextDirection.rtl时靠右
//              textAlign: TextAlign.end,// TextDirection.ltr时靠右，TextDirection.rtl时靠左
//              textAlign: TextAlign.justify,// 两端对齐

              // 从左边还是右边开始输入文字
              textDirection: TextDirection.ltr, //从左边输入  光标在左边
//              textDirection: TextDirection.rtl, //从右边输入  光标在右边

              //输入文本的样式  字体大小  颜色 等
              style: TextStyle(fontSize: 50.0, color: Colors.blue),

              //是否启用输入  如果是false 就无法输入了，且errorText失效
              enabled: true,
//              enabled: false,

              //白名单校验，只允许输入符合规则的文本
//              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式,不是控制的键盘，只有符合格式的输入才会显示 digitsOnly表示只允许数字。
//              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z]"))],//只允许输入a-z小写字母。

              //允许输入的最大长度，一个字母一个符号一个汉字都算1 不会显示右下角的字数
              //如果设置了maxLength  那么长度限制以这里的限制为准，但是会显示右下角的字数
//              inputFormatters: [LengthLimitingTextInputFormatter(15)],

              //黑名单校验，只允许输入给定规则以外的文本
//            inputFormatters: [BlacklistingTextInputFormatter(RegExp("[a-z]"))],//不允许输入a-z小写字母
//            inputFormatters: [BlacklistingTextInputFormatter(RegExp("[a-z]"),replacementString: "-")],//不允许输入a-z小写字母  如果输入了 用“-”替代

              //弹出的键盘的类型
              keyboardType: TextInputType.text, // 文本
//              keyboardType: TextInputType.number,//数字  数字键盘  + 部分常用数学符合
//              keyboardType: TextInputType.phone,//手机号  数字键盘  + 部分手机号常用符合"*", and "#".
//              keyboardType: TextInputType.datetime,// 时间  数字键盘  + 部分时间常用符合":", and "-".
//              keyboardType: TextInputType.emailAddress,//邮件  英文键盘 + 邮件符合  "@" and "."
//              keyboardType: TextInputType.multiline,// 多行输入   控制enter键的功能为换行了
//              keyboardType: TextInputType.url,//url格式 英文键盘+url符合 "/" and "."

              //设置键盘上enter键的显示内容
              textInputAction: TextInputAction.search, //搜索
//              textInputAction: TextInputAction.none,//默认回车符号
//              textInputAction: TextInputAction.done,//安卓显示 回车符号
//              textInputAction: TextInputAction.go,//开始
//              textInputAction: TextInputAction.next,//下一步
//              textInputAction: TextInputAction.send,//发送
//              textInputAction: TextInputAction.continueAction,//android  不支持
//              textInputAction: TextInputAction.emergencyCall,//android  不支持
//              textInputAction: TextInputAction.newline,//安卓显示 回车符号
//              textInputAction: TextInputAction.route,//android  不支持
//              textInputAction: TextInputAction.join,//android  不支持
//              textInputAction: TextInputAction.previous,//安卓显示 回车符号
//              textInputAction: TextInputAction.unspecified,//安卓显示 回车符号

              // 控制键盘大小写切换的   试过了 但是好像没有效果？？
//              textCapitalization: TextCapitalization.characters,  // 输入时键盘的英文都是大写
//              textCapitalization: TextCapitalization.none,  //  键盘英文默认显示小写
//              textCapitalization: TextCapitalization.sentences, // 在输入每个句子的第一个字母时，键盘大写形式，输入后续字母时键盘小写形式
//              textCapitalization: TextCapitalization.words,// 在输入每个单词的第一个字母时，键盘大写形式，输入其他字母时键盘小写形式

              //光标颜色
              cursorColor: Colors.red,
              //光标圆角
              cursorRadius: Radius.circular(5),
              //光标宽度
              cursorWidth: 10,

              //输入框的边框样式
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.transparent)),
                //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                contentPadding: EdgeInsets.all(10.0),
                fillColor: Colors.white, filled: true,
//            labelText: 'Hello',
                // 以下属性可用来去除TextField的边框
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),

              // 键盘外观  仅ios有效
//              keyboardAppearance: Brightness.light,
              keyboardAppearance: Brightness.dark,

              //？？？暂未发现什么用途
              scrollPadding: EdgeInsets.all(50),

              //？？？暂未发现什么用途
//              dragStartBehavior: DragStartBehavior.start,
              dragStartBehavior: DragStartBehavior.down,

              //长按输入的文字时，true显示系统的粘贴板  false不显示
              enableInteractiveSelection: true,

              //自定义数字显示   指定maxLength后 右下角会出现字数，flutter有默认实现  可以通过这个自定义
              buildCounter: buildcount,

              //点击一次输入就调用
              onTap: () {
                print('ontap');
              },
              onChanged: (text) {
                //输入内容变化后，调用
                print('change $text');
              },
              onSubmitted: (text) {
                //键盘按回车后调用
                print('submit $text');
              },
              //按回车时调用 先调用此方法  然后调用onSubmitted方法
              onEditingComplete: () {
                print('onEditingComplete');
              },
            ),
            


TextField decoration
我们首先来看一下decoration
decoration（装饰器） 接收一个InputDecoration类型的值，主要用于控制TextField的外观以及提示信息等
我们来看看InputDecoration的构造方法
InputDecoration({
    this.icon,    //位于装饰器外部和输入框前面的图片
    this.labelText,  //用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方，
    this.labelStyle,  // 控制labelText的样式,接收一个TextStyle类型的值
    this.helperText, //辅助文本，位于输入框下方，如果errorText不为空的话，则helperText不会显示
    this.helperStyle, //helperText的样式
    this.hintText,  //提示文本，位于输入框内部
    this.hintStyle, //hintText的样式
    this.hintMaxLines, //提示信息最大行数
    this.errorText,  //错误信息提示
    this.errorStyle, //errorText的样式
    this.errorMaxLines,   //errorText最大行数
    this.hasFloatingPlaceholder = true,  //labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示
    this.isDense,   //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小
    this.contentPadding, //内间距
    this.prefixIcon,  //位于输入框内部起始位置的图标。
    this.prefix,   //预先填充的Widget,跟prefixText同时只能出现一个
    this.prefixText,  //预填充的文本，例如手机号前面预先加上区号等
    this.prefixStyle,  //prefixText的样式
    this.suffixIcon, //位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文
    this.suffix,  //位于输入框尾部的控件，同样的不能和suffixText同时使用
    this.suffixText,//位于尾部的填充文字
    this.suffixStyle,  //suffixText的样式
    this.counter,//位于输入框右下方的小控件，不能和counterText同时使用
    this.counterText,//位于右下方显示的文本，常用于显示输入的字符数量
    this.counterStyle, //counterText的样式
    this.filled,  //如果为true，则输入使用fillColor指定的颜色填充
    this.fillColor,  //相当于输入框的背景颜色
    this.errorBorder,   //errorText不为空，输入框没有焦点时要显示的边框
    this.focusedBorder,  //输入框有焦点时的边框,如果errorText不为空的话，该属性无效
    this.focusedErrorBorder,  //errorText不为空时，输入框有焦点时的边框
    this.disabledBorder,  //输入框禁用时显示的边框，如果errorText不为空的话，该属性无效
    this.enabledBorder,  //输入框可用时显示的边框，如果errorText不为空的话，该属性无效
    this.border, //正常情况下的border
    this.enabled = true,  //输入框是否可用
    this.semanticCounterText,  
    this.alignLabelWithHint,
  })
————————————————
版权声明：本文为CSDN博主「喻志强」的原创文章，遵循 CC 4.0 BY 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://yuzhiqiang.blog.csdn.net/article/details/88204031



高德地图 相关   
账号 18072942952  chenjishita

android 
签名相关
chenjishita
chenjishita
chenjishita

192:flutter_chenji_ista_app nanzong$ keytool -list -v -keystore /Users/nanzong/workspace/fultter_yuan/flutter_first_test/flutter_chenji_ista_app/flutter_chenji_ista_app/chenjishita.jks
输入密钥库口令:  
密钥库类型: jks
密钥库提供方: SUN

您的密钥库包含 1 个条目

别名: chenjishita
创建日期: 2019-9-18
条目类型: PrivateKeyEntry
证书链长度: 1
证书[1]:
所有者: CN=chenjishita, OU=chenjishita, O=chenjishita, L=chenjishita, ST=chenjishita, C=chenjishita
发布者: CN=chenjishita, OU=chenjishita, O=chenjishita, L=chenjishita, ST=chenjishita, C=chenjishita
序列号: 9f0062b
有效期为 Wed Sep 18 09:45:14 CST 2019 至 Sun Sep 11 09:45:14 CST 2044
证书指纹:
         MD5:  17:F2:E1:95:5E:B6:E7:EB:18:40:1D:7C:6D:73:C1:82
         SHA1: A3:C4:94:BA:A0:7A:6E:68:1D:68:06:F4:CB:AA:D7:43:3B:CD:95:A0
         SHA256: D5:BD:14:B1:48:24:23:7D:C1:CC:34:A0:F7:00:95:E7:07:59:AA:A6:5A:D0:A5:12:01:B9:59:6C:CF:EA:73:CF
签名算法名称: SHA256withRSA
主体公共密钥算法: 2048 位 RSA 密钥
版本: 3

扩展: 

#1: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: A6 AD CB 07 3B F6 4D 88   72 51 C8 FD 5A 66 B0 84  ....;.M.rQ..Zf..
0010: AF 14 76 B2                                        ..v.
]
]



*******************************************
*******************************************



Warning:
JKS 密钥库使用专用格式。建议使用 "keytool -importkeystore -srckeystore /Users/nanzong/workspace/fultter_yuan/flutter_first_test/flutter_chenji_ir_chenji_ista_app/chenjishita.jks -destkeystore /Users/nanzong/workspace/fultter_yuan/flutter_first_test/flutter_chenji_ista_app/flutter_chenji_ista_app/chenjishita.jks -deststoretype pkcs12" 迁移到行业标准格式 PKCS12。
192:flutter_chenji_ista_app nanzong$ 
