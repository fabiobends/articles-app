part of 'auth_form_bloc.dart';

abstract class AuthFormEvent extends Equatable {
  const AuthFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends AuthFormEvent {
  final Email email;

  const EmailChanged({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends AuthFormEvent {}

class PasswordChanged extends AuthFormEvent {
  final Password password;

  const PasswordChanged({
    required this.password,
  });

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends AuthFormEvent {}

class FormSent extends AuthFormEvent {}
