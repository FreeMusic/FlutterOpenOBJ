import 'dart:convert';

import 'package:amap_base_location/amap_base_location.dart';
import 'package:flutter/material.dart';


class AMapLocationDemo extends StatefulWidget {
  AMapLocationDemo({Key key}) : super(key: key);

  @override
  createState() => _AMapLocationDemoState();
}

class _AMapLocationDemoState extends State<AMapLocationDemo>
    with AutomaticKeepAliveClientMixin {
  final _amapLocation = AMapLocation();

  List<Location> _result = [];

  @override
  void initState() {
    super.initState();

    _amapLocation.init();
  }

  @override
  void dispose() {
    _amapLocation.stopLocate();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children:
              _result.map((location) => _ResultItem(location)).toList(),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Button(
                      onPressed: () async {
                        final options = LocationClientOptions(
                          isOnceLocation: true,
                          locatingWithReGeocode: true,
                        );

                        if (await Permissions.requestMapPermission()) {
                          _amapLocation
                              .getLocation(options)
                              .then(_result.add)
                              .then((_) => setState(() {}));
                        } else {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text('权限不足')));
                        }
                      },
                      text: '单次定位')),
              Expanded(
                  child: Button(
                    text: '连续定位',
                    onPressed: () async {
                      final options = LocationClientOptions(
                        isOnceLocation: false,
                        locatingWithReGeocode: true,
                      );

                      if (await Permissions.requestMapPermission()) {
                        _amapLocation
                            .startLocate(options)
                            .map(_result.add)
                            .listen((_) => setState(() {}));
                      } else {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('权限不足')));
                      }
                    },
                  )),
              Expanded(
                  child: Button(
                    text: '停止定位',
                    onPressed: () {
                      _amapLocation.stopLocate();
                    },
                  ))
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ResultItem extends StatelessWidget {
  final Location _data;

  const _ResultItem(this._data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DateTime.now().toIso8601String(),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  decoration: TextDecoration.none)),
          Text(jsonFormat(_data.toJson()),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  decoration: TextDecoration.none))
        ],
      ),
    );
  }

  String jsonFormat(Map<String, Object> json) {
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }
}


class Button extends StatelessWidget {
  Button(
      {Key key,
        this.text,
        @required this.onPressed,
        this.borderRadius: 5.0,
        this.color,
        this.height: 48.0,
        this.textColor,
        this.disabledColor,
        this.textSize: 18,
        this.disabledTextColor,
        this.width,
        this.hasBorder: false,
        this.disabledBorderColor,
        this.highlightedBorderColor,
        this.borderWidth: 1.0,
        this.borderColor})
      : super(key: key);

  final String text;
  final double borderRadius;
  final double textSize;

  final VoidCallback onPressed;

  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;

  final double width;
  final double height;

  final bool hasBorder;
  final Color disabledBorderColor;
  final Color highlightedBorderColor;
  final double borderWidth;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return hasBorder
        ? OutlineButton(
      onPressed: onPressed,
      textColor: textColor ?? Colors.white,
      disabledTextColor: disabledTextColor ?? Color(0xFFD4E2FA),
      disabledBorderColor: disabledBorderColor ?? color ?? Colors.grey,
      highlightedBorderColor:
      highlightedBorderColor ?? Theme.of(context).accentColor,
      borderSide: BorderSide(
          width: borderWidth, color: borderColor ?? Colors.white),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Container(
          height: height,
          width: width ?? double.infinity,
          alignment: Alignment.center,
          child: Text('$text', style: TextStyle(fontSize: textSize))),
    )
        : FlatButton(
      onPressed: onPressed,
      textColor: textColor ?? Colors.white,
      disabledTextColor: disabledTextColor ?? Color(0xFFD4E2FA),
      color: color ?? Theme.of(context).accentColor,
      disabledColor: disabledColor ?? Color(0xFF96BBFA),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Container(
          height: height,
          width: width ?? double.infinity,
          alignment: Alignment.center,
          child: Text('$text', style: TextStyle(fontSize: textSize))),
    );
  }
}
