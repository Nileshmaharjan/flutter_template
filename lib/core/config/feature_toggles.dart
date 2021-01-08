import 'package:sample/config/enum.dart';

enum Feature { TEST }

class FeatureToggles {
  final AppEnvironment _appEnvironment;

  FeatureToggles(
    this._appEnvironment,
  );

  bool isEnabled(Feature feature) {
    switch (feature) {
      default:
        return false;
    }
  }
}
