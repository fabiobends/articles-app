part of 'form_bloc.dart';

abstract class FormState extends Equatable {
  const FormState();

  @override
  List<Object> get props => [];
}

class FormInitial extends FormState {}

class FormInProgress extends FormState {
  final String email;
  final String password;

  const FormInProgress({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class FormSuccess extends FormState {}

class FormFailure extends FormState {
  final String messageError;

  const FormFailure(this.messageError);

  @override
  List<Object> get props => [messageError];
}
