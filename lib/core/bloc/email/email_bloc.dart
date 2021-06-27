import 'dart:async';

import 'package:articles_app/core/data/repositories/form_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final FormRepository _formRepository;
  EmailBloc(this._formRepository) : super(EmailInitial());

  @override
  Stream<EmailState> mapEventToState(EmailEvent event) async* {
    if (event is EmailUnfocused) {
      try {
        var _email = _formRepository.checkEmail(event.value);
        yield EmailSuccess(_email);
      } catch (err) {
        yield EmailFailure("Your email is typed wrong, invalid email.");
      }
    }
    if (event is EmailChanged) {
      var _password = _formRepository.checkPassword(event.value);
      yield EmailSuccess(_password);
    }
  }
}
