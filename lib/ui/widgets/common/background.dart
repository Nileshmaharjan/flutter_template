import 'package:flutter/material.dart';
import 'package:sample/res/colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0, 1],
        colors: [
          AppColors.gradientStartColor,
          AppColors.gradientEndColor,
        ],
      )),
    );
  }
}
