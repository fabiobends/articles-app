import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailEvent:', () {
    group('EmailChanged', () {
      test('supports value comparison', () {
        expect(
          EmailChanged(email: Email(value: 'foo@gmail.com')),
          EmailChanged(email: Email(value: 'foo@gmail.com')),
        );
      });
      test('is a valid event even when the input is wrong', () {
        expect(
          EmailChanged(email: Email(value: 'foo@gmail.')),
          isA<EmailChanged>(),
        );
      });
    });
    group('EmailUnfocused', () {
      test('supports value comparison', () {
        expect(
          EmailUnfocused(),
          EmailUnfocused(),
        );
      });
    });
  });
}
