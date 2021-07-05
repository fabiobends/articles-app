import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/data/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmailState:', () {
    group('EmailInitial', () {
      test('supports value comparision', () {
        expect(EmailInitial(), EmailInitial());
      });
    });
    group('EmailSuccess', () {
      test('supports value comparision', () {
        expect(
          const EmailSuccess(email: Email(value: 'foo@gmail.com')),
          const EmailSuccess(email: Email(value: 'foo@gmail.com')),
        );
        expect(
          const EmailSuccess(email: Email(value: 'foo@gmail.com')),
          isNot(
            equals(
              const EmailSuccess(email: Email(value: 'fo@gmail.com')),
            ),
          ),
        );
      });
    });
  });
}
