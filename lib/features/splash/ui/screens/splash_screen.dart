import 'package:flutter/material.dart';
import 'package:sample/features/splash/ui/screens/app_loading.dart';
import 'package:sample/routing.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // To check If the user is logged in or not and redirect to specific screens
      await Navigator.pushReplacementNamed(context, Routing.routeLogin);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppLoading();
  }
}
