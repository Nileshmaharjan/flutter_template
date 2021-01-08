import 'package:flutter/material.dart';

void displayMessage(BuildContext context, var message) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
        SnackBar(duration: Duration(seconds: 2), content: Text(message)));
}
