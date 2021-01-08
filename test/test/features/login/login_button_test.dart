import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample/features/login/ui/widgets/login_button.dart';

import '../../helper/widget_test_helper.dart';

void main() {
  testWidgets('Test Welcome screen test', (WidgetTester tester) async {
    var onPressed = Completer<void>();
    await tester.pumpWidget(WidgetTestHelper.getMaterialApp(LoginButton(
      'Login',
      onPressed: onPressed.complete,
    )));
    expect(find.text('Login'), findsOneWidget);
    await tester.tap(find.byKey(Key('login-button-key')));
    expect(onPressed.isCompleted, isTrue);
  });
}
