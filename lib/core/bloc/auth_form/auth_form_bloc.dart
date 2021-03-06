import 'dart:async';

import 'package:articles_app/core/data/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_form_event.dart';
part 'auth_form_state.dart';

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc() : super(FormInitial());

  @override
  Stream<AuthFormState> mapEventToState(AuthFormEvent event) async* {
    if (event is FormSent) {
      try {
        yield FormInProgress(email: event.email, password: event.password);
        if (state.email.validator() && state.password.validator()) {
          yield FormSuccess(email: state.email, password: state.password);
        } else {
          yield FormFailure(
              "You typed wrong information. Verify your email and password.");
        }
      } catch (err) {
        yield FormFailure(
            "Something went wrong, server problem or internet issue.");
      }
    }
  }
}
