import 'dart:async';

import 'package:articles_app/core/data/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'email_event.dart';
part 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(EmailInitial());

  @override
  Stream<EmailState> mapEventToState(EmailEvent event) async* {
    if (event is EmailChanged) {
      yield EmailInProgress(email: event.email);
      state.email.validator();
      yield EmailSuccess(email: state.email);
    } else if (event is EmailUnfocused) {
      try {
        state.email.validator();
        yield EmailSuccess(email: state.email);
      } catch (err) {
        yield EmailFailure("Your email is typed wrong, invalid email.");
      }
    }
  }
}
