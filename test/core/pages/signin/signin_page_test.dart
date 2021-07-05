import 'package:articles_app/core/pages/signin/signin_page.dart';
import 'package:articles_app/core/pages/signin/singin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testPage({Widget? child}) {
    return MaterialApp(home: child);
  }

  group('Sign in Page:', () {
    testWidgets('renders the page with presenter', (tester) async {
      await tester.pumpWidget(testPage(child: SignInPage()));

      expect(find.byType(MultiBlocProvider), findsOneWidget);
    });
    testWidgets('renders the page with view', (tester) async {
      await tester.pumpWidget(testPage(child: SignInPage()));

      expect(find.byType(SignInView), findsOneWidget);
    });
  });
}
