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
}

class FormSuccess extends AuthFormState {
  final Email email;
  final Password password;

  const FormSuccess({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class FormFailure extends AuthFormState {
  final String errorMessage;

  const FormFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
