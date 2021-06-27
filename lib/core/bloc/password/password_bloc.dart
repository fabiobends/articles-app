import 'dart:async';

import 'package:articles_app/core/data/repositories/form_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final FormRepository _formRepository;
  PasswordBloc(this._formRepository) : super(PasswordInitial());

  @override
  Stream<PasswordState> mapEventToState(PasswordEvent event) async* {
    if (event is PasswordUnfocused) {
      try {
        var _password = _formRepository.checkPassword(event.value);
        yield PasswordSuccess(_password);
      } catch (err) {
        yield PasswordFailure(
            "Your password should be at least 8 digits long.");
      }
    }
    if (event is PasswordChanged) {
      var _password = _formRepository.checkPassword(event.value);
      yield PasswordSuccess(_password);
    }
  }
}
