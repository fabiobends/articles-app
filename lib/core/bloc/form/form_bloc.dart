import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(FormInitial());

  @override
  Stream<FormState> mapEventToState(FormEvent event) async* {
    if (event is FormSent) {
      try {
        yield FormInProgress(email: event.email, password: event.password);
        yield FormSuccess();
      } catch (err) {
        yield FormFailure("Verify your internet, it couldn't send your info");
      }
    }
  }
}
