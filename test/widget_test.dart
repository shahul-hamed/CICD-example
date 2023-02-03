// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';
import 'dart:io';

import 'package:cicd_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = _MyHttpOverrides();
  testWidgets('Login widgets smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.byKey(const Key("image")), findsOneWidget);
    expect(find.text('1'), findsNothing);
    // find email and password fields
    var email = find.byKey(const Key("email"));
    expect(email, findsOneWidget);
    var pass = find.byKey(const Key("password"));
    expect(pass, findsOneWidget);
    await tester.enterText(email, "test@gmail.com");
    await tester.enterText(pass, "123456");
    await tester.tap(find.byKey(const Key('login')));
    log("login test completed");
  });
}
class _MyHttpOverrides extends HttpOverrides {}