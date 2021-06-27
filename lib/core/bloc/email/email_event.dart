part of 'email_bloc.dart';

abstract class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

class EmailUnfocused extends EmailEvent {
  final String value;
  const EmailUnfocused(this.value);
}

class EmailChanged extends EmailEvent {
  final String value;
  const EmailChanged(this.value);
}
