import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/res/colors.dart';


class AppLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (BuildContext context, Widget child) {
          ScreenUtil.init(context,
              designSize: Size(374, 812), allowFontScaling: true);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child,
          );
        },
        home: AppLoadingScreen());
  }
}

class AppLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(''),
        ),
        decoration: BoxDecoration(color: AppColors.almostWhite),
      ),
    );
  }
}
