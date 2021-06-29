import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/email/email_bloc.dart';
import 'core/bloc/form/form_bloc.dart';
import 'core/bloc/password/password_bloc.dart';
import 'core/data/repositories/form_repository.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _formRepository = FormRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Articles App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<EmailBloc>(
            create: (BuildContext context) => EmailBloc(_formRepository),
          ),
          BlocProvider<PasswordBloc>(
            create: (BuildContext context) => PasswordBloc(_formRepository),
          ),
          BlocProvider<FormBloc>(
            create: (BuildContext context) => FormBloc(),
          ),
        ],
        child: LoginPage(),
      ),
    );
  }
}
