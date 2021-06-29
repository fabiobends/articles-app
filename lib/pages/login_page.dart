import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/bloc/password/password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        var emailBloc = context.read<EmailBloc>();
        emailBloc.add(EmailUnfocused(emailBloc.state.value));
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        var passwordBloc = context.read<PasswordBloc>();
        passwordBloc.add(PasswordUnfocused(passwordBloc.state.value));
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Login Page'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage('https://picsum.photos/300/300'),
                    height: 200,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  focusNode: _emailFocusNode,
                  decoration: InputDecoration(hintText: 'enter email'),
                ),
                TextFormField(
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(hintText: 'enter password'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
