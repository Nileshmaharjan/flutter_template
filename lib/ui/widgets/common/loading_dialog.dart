import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class LoadingDialog {
  static void cancel(BuildContext context) async {
    Navigator.of(context).pop(true);
  }

  static void open(BuildContext context, {String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoadingIndicator(),
              message != null
                  ? Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        message,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(color: Colors.white),
                      ),
                    )
                  : Container()
            ],
          ),
        );
      },
    );
  }
}
