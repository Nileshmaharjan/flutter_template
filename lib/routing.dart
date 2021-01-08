import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sample/features/login/ui/login_username_password_screen.dart';
import 'package:sample/features/splash/ui/screens/splash_screen.dart';

class Routing {
  static String routeLoading = '/';
  static String routeLogin = '/welcome';

  Router buildRoutes(RouteSettings settings) {
    var router = Router();

    router.define(routeLogin, transitionType: TransitionType.fadeIn, handler:
        Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return LoginWithUsernamePasswordScreen();
    }));

    router.define(routeLoading, transitionType: TransitionType.fadeIn, handler:
        Handler(
            handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return SplashScreen();
    }));

    return router;
  }
}
