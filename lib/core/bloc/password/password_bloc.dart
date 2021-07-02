import 'dart:async';

import 'package:articles_app/core/data/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitial());

  @override
  void onTransition(Transition<PasswordEvent, PasswordState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    if (event is PasswordChanged) {
      yield PasswordInProgress(password: event.password);
      state.password.validator();
      yield PasswordSuccess(password: state.password);
    } else if (event is PasswordUnfocused) {
      try {
        state.password.validator();
        yield PasswordSuccess(password: state.password);
      } catch (err) {
        yield PasswordFailure(
            "Your password should be at least 8 digits long.");
      }
    }
  }
}
