import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/data/models/models.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// class MockEmail extends Mock implements Email {}

// class MockEmailBloc extends MockBloc<EmailEvent, EmailState>
// implements EmailBloc {}

class FakeEmailEvent extends Fake implements EmailEvent {}

class FakeEmailState extends Fake implements EmailState {}

void main() {
  group('EmailBloc:', () {
    late Email emailValid;
    late Email emailInvalid;
    late EmailBloc emailBloc;

    setUp(() {
      emailValid = Email(value: 'foo@gmail.com');
      emailInvalid = Email(value: 'foo');
      emailBloc = EmailBloc();
    });

    tearDown(() {
      emailBloc.close();
    });

    test('initial state is EmailInitial', () {
      expect(emailBloc.state, EmailInitial());
    });

    blocTest<EmailBloc, EmailState>(
      "emits [] when email has not changed.",
      build: () => emailBloc,
      expect: () => [],
    );

    blocTest<EmailBloc, EmailState>(
      'emits EmailInProgress when email has changed, '
      'then nothing else when it is invalid.',
      build: () => emailBloc,
      act: (_) => emailBloc.add(EmailChanged(email: emailInvalid)),
      expect: () => [EmailInProgress(email: emailInvalid)],
    );

    blocTest<EmailBloc, EmailState>(
      'emits EmailInProgress when email field has changed, then '
      'right after being unfocused, it emits EmailFailure when it is invalid.',
      build: () => emailBloc,
      act: (_) => emailBloc
        ..add(EmailChanged(email: emailInvalid))
        ..add(EmailUnfocused()),
      expect: () => [
        EmailInProgress(email: emailInvalid),
        EmailFailure('Your email is typed wrong, invalid email.')
      ],
    );

    blocTest<EmailBloc, EmailState>(
      'emits EmailInProgress when email has changed, '
      'then EmailSuccess when it is valid.',
      build: () => emailBloc,
      act: (_) => emailBloc.add(EmailChanged(email: emailValid)),
      expect: () => [
        EmailInProgress(email: emailValid),
        EmailSuccess(email: emailValid),
      ],
    );

    blocTest<EmailBloc, EmailState>(
      'emits EmailInProgress when email field has changed, '
      'then EmailSuccess when it is valid. Right after being unfocused, '
      'it keeps EmailSuccess state but not yielding a new state.',
      build: () => emailBloc,
      act: (_) => emailBloc
        ..add(EmailChanged(email: emailValid))
        ..add(EmailUnfocused()),
      expect: () => [
        EmailInProgress(email: emailValid),
        EmailSuccess(email: emailValid),
      ],
    );
  });
}
