part of 'auth_form_bloc.dart';

abstract class AuthFormEvent extends Equatable {
  const AuthFormEvent();

  @override
  List<Object> get props => [];
}

class FormSent extends AuthFormEvent {
  final Email email;
  final Password password;

  const FormSent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
