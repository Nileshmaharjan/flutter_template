import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/config/enum.dart';
import 'package:sample/features/login/bloc/authentication_bloc.dart';
import 'package:sample/features/login/bloc/bloc.dart';
import 'package:sample/features/splash/ui/screens/app_loading.dart';
import 'package:sample/routing.dart';
import 'package:sample/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/injection/dependency_injection.dart' as di;
import 'core/injection/dependency_injection.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    print('$error, $stacktrace');
  }
}

class Env {
  static Env value;

  String baseUrl;
  String clientId;

  AppEnvironment appEnvironment;

  Env() {
    value = this;

    // Force the application to remain in portrait mode
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    if (appEnvironment != AppEnvironment.Production) {
      Bloc.observer = SimpleBlocDelegate();
    }

    Future<void> awaitPreAppStartupDependencies() async {
      await di.init(appEnvironment); // initialize dependency injection
    }

    runApp(FutureBuilder(
        future: awaitPreAppStartupDependencies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BlocProvider(
              create: (context) => sl<AuthenticationBloc>()..add(AppStarted()),
              child: GestureDetector(
                onTap: () {
                  var currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus.unfocus();
                  }
                },
                child: MaterialApp(
                  title: 'Sample',
                  // Ensure all routes initialise the `ScreenUtil`
                  builder: (BuildContext context, Widget child) {
                    ScreenUtil.init(context,
                        designSize: Size(375, 812),
                        allowFontScaling:
                            true); // This option does the opposite of what it claims to do. By setting it as true, it'll ignore the system font scaling
                    return MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: child,
                    );
                  },
                  theme: sampleAppTheme(),
                  onGenerateRoute: (settings) {
                    return Routing().buildRoutes(settings).generator(settings);
                  },
                ),
              ),
            );
          }
          // async services to be registered
          return AppLoading();
        }));
  }

  String get name => runtimeType.toString();
}
