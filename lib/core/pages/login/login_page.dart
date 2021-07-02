import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/bloc/password/password_bloc.dart';
import 'package:articles_app/core/bloc/auth_form/auth_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmailBloc>(
          create: (context) => EmailBloc(),
        ),
        BlocProvider<PasswordBloc>(
          create: (context) => PasswordBloc(),
        ),
        BlocProvider<AuthFormBloc>(
          create: (context) => AuthFormBloc(),
        ),
      ],
      child: LoginView(),
    );
  }
}
