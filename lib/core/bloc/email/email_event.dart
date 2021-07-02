part of 'email_bloc.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends EmailEvent {
  final Email email;
  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends EmailEvent {}
