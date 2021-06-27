part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class FormSent extends FormEvent {
  final String email;
  final String password;

  const FormSent({required this.email, required this.password});
}
