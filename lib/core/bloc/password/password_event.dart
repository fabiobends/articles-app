part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object> get props => [];
}

class PasswordUnfocused extends PasswordEvent {
  final String value;
  const PasswordUnfocused(this.value);
}

class PasswordChanged extends PasswordEvent {
  final String value;
  const PasswordChanged(this.value);
}
