part of 'auth_form_bloc.dart';

abstract class AuthFormState extends Equatable {
  final Email email;
  final Password password;

  const AuthFormState({
    this.email = const Email(value: ''),
    this.password = const Password(value: ''),
  });

  @override
  List<Object> get props => [email, password];
}

class FormInitial extends AuthFormState {}

class FormInProgress extends AuthFormState {
  final Email email;
  final Password password;

  const FormInProgress({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  FormInProgress copyWith({
    Email? email,
    Password? password,
  }) {
    return FormInProgress(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class FormSuccess extends AuthFormState {}

class FormFailure extends AuthFormState {
  final String formMessageError;

  const FormFailure(this.formMessageError);

  @override
  List<Object> get props => [formMessageError];
}

class EmailInitial extends AuthFormState {}

class EmailSuccess extends AuthFormState {}

class EmailFailure extends AuthFormState {
  final String emailMessageError;

  const EmailFailure(this.emailMessageError);

  @override
  List<Object> get props => [emailMessageError];
}

class PasswordInitial extends AuthFormState {}

class PasswordSuccess extends AuthFormState {}

class PasswordFailure extends AuthFormState {
  final String passwordMessageError;

  const PasswordFailure(this.passwordMessageError);

  @override
  List<Object> get props => [passwordMessageError];
}
