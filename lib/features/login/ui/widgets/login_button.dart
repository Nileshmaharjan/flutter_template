import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/res/index.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  LoginButton(this.text, {Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      child: RaisedButton(
        key: Key('login-button-key'),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        color: AppColors.gradientStartColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 18.0.sp,
              ),
        ),
      ),
    );
  }
}
