import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color valueColour;
  final double strokeWidth;

  LoadingIndicator(
      {Key key, this.strokeWidth = 1.0, this.valueColour = Colors.white});

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(valueColour),
        ),
      );
}
