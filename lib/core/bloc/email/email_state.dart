part of 'email_bloc.dart';

abstract class EmailState extends Equatable {
  final String value;
  const EmailState({this.value = ''});

  @override
  List<Object> get props => [value];
}

class EmailInitial extends EmailState {}

class EmailSuccess extends EmailState {
  final String value;

  const EmailSuccess(this.value);

  @override
  List<Object> get props => [value];
}

class EmailFailure extends EmailState {
  final String errorMessage;
  const EmailFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
