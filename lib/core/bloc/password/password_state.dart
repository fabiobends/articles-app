part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

class PasswordInitial extends PasswordState {
  final String value;

  const PasswordInitial({this.value = ''});

  @override
  List<Object> get props => [value];
}

class PasswordFailure extends PasswordState {
  final String errorMessage;
  const PasswordFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class PasswordSuccess extends PasswordState {
  final String value;

  const PasswordSuccess(this.value);

  @override
  List<Object> get props => [value];
}
