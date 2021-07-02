part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  final Password password;
  const PasswordState({
    this.password = const Password(value: ''),
  });

  @override
  List<Object> get props => [password];
}

class PasswordInitial extends PasswordState {}

class PasswordInProgress extends PasswordState {
  final Password password;

  const PasswordInProgress({required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordSuccess extends PasswordState {
  final Password password;

  const PasswordSuccess({required this.password});

  @override
  List<Object> get props => [password];
}

class PasswordFailure extends PasswordState {
  final String errorMessage;
  const PasswordFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
