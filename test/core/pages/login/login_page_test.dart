import 'package:articles_app/core/pages/login/login_page.dart';
import 'package:articles_app/core/pages/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testPage({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  group('Login Page:', () {
    testWidgets('renders page with presenter', (tester) async {
      // Builds the page
      await tester.pumpWidget(testPage(child: LoginPage()));
      // Finds bloc for this page
      expect(find.byType(MultiBlocProvider), findsOneWidget);
    });
    testWidgets('renders page with view', (tester) async {
      // Builds the page
      await tester.pumpWidget(testPage(child: LoginPage()));
      // Finds the view
      expect(find.byType(LoginView), findsOneWidget);
    });
  });
}
