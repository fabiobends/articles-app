part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class PasswordChanged extends PasswordEvent {
  final Password password;
  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends PasswordEvent {}
