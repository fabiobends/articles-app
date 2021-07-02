part of 'email_bloc.dart';

abstract class EmailState extends Equatable {
  final Email email;
  const EmailState({this.email = const Email(value: '')});

  @override
  List<Object> get props => [email];
}

class EmailInitial extends EmailState {}

class EmailInProgress extends EmailState {
  final Email email;

  const EmailInProgress({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailSuccess extends EmailState {
  final Email email;

  const EmailSuccess({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailFailure extends EmailState {
  final String errorMessage;
  const EmailFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
