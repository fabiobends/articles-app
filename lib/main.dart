import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/auth_form/auth_form_bloc.dart';
// import 'core/data/repositories/form_repository.dart';
import 'core/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var _formRepository = FormRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Articles App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AuthFormBloc(),
        child: LoginPage(),
      ),
    );
  }
}
