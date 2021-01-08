import 'package:flutter/material.dart';
import 'package:sample/routing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetTestHelper {
  void main() {}

  static Widget getMaterialApp(
    Widget widget, {
    NavigatorObserver navigatorObserver,
  }) {
    return MaterialApp(
        home: Material(child: Builder(builder: (BuildContext context) {
          ScreenUtil.init(context,
              designSize: Size(375, 812), allowFontScaling: true);
          return widget;
        })),
        onGenerateRoute: (settings) =>
            Routing().buildRoutes(settings).generator(settings));
  }
}
