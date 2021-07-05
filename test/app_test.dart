// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:articles_app/core/pages/signin/signin_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:articles_app/main.dart';

void main() {
  testWidgets("renders 'Signin Page' at the entry point", (tester) async {
    // Builds the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Finds the page.
    expect(find.byType(SignInPage), findsOneWidget);

    // Finds app bar text properly.
    expect(find.widgetWithText(SignInPage, 'SignIn Page'), findsOneWidget);
  });
}
