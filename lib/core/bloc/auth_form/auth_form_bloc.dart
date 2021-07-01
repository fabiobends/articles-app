import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:articles_app/core/data/models/email.dart';
import 'package:articles_app/core/data/models/password.dart';

part 'auth_form_event.dart';
part 'auth_form_state.dart';

class AuthFormBloc extends Bloc<AuthFormEvent, AuthFormState> {
  AuthFormBloc() : super(FormInitial());

  @override
  Stream<AuthFormState> mapEventToState(AuthFormEvent event) async* {
    if (event is EmailChanged) {
      yield FormInProgress(email: event.email, password: state.password);
      event.email.validator();
      yield EmailSuccess();
    } else if (event is EmailUnfocused) {
      try {
        yield FormInProgress(email: state.email, password: state.password);
        state.email.validator();
        yield EmailSuccess();
      } catch (err) {
        print(err.runtimeType);
        yield EmailFailure("Your email is typed wrong, invalid email.");
      }
    }
    if (event is PasswordChanged) {
      yield FormInProgress(email: state.email, password: event.password);
      event.password.validator();
      yield PasswordSuccess();
    } else if (event is PasswordUnfocused) {
      try {
        yield FormInProgress(email: state.email, password: state.password);
        state.password.validator();
        yield PasswordSuccess();
      } catch (err) {
        print(err.runtimeType);
        yield PasswordFailure(
            "Your password should be at least 8 digits long.");
      }
    }
    if (event is FormSent) {
      try {
        state.email.validator();
        state.password.validator();
        // TODO: send the form to the server
        yield FormSuccess();
      } catch (err) {
        print(err.runtimeType);
        yield FormFailure("Verify your internet, it couldn't send your info");
      }
    }
  }
}
