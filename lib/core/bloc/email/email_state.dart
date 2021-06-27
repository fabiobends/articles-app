part of 'email_bloc.dart';

abstract class EmailState extends Equatable {
  const EmailState();

  @override
  List<Object> get props => [];
}

class EmailInitial extends EmailState {
  final String value;

  const EmailInitial({this.value = ''});

  @override
  List<Object> get props => [value];
}

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
