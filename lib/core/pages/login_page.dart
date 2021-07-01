import 'package:articles_app/core/bloc/auth_form/auth_form_bloc.dart';
import 'package:articles_app/core/data/models/email.dart';
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
        var form = context.read<AuthFormBloc>();
        form.add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        var form = context.read<AuthFormBloc>();
        form.add(PasswordUnfocused());
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
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        focusNode: _emailFocusNode,
                        decoration: InputDecoration(hintText: 'enter email'),
                        onChanged: (content) {
                          var form = context.read<AuthFormBloc>();
                          form.add(
                            EmailChanged(
                              email: Email(value: content),
                            ),
                          );
                        },
                      ),
                    ),
                    BlocBuilder<AuthFormBloc, AuthFormState>(
                      builder: (context, state) {
                        if (state is EmailSuccess) {
                          return Icon(
                            Icons.check_circle_outlined,
                            color: Colors.green,
                          );
                        } else if (state is EmailFailure) {
                          return Icon(
                            Icons.close,
                            color: Colors.red,
                          );
                        } else {
                          return Icon(
                            Icons.check_circle_outlined,
                            color: Colors.grey,
                          );
                        }
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        focusNode: _passwordFocusNode,
                        decoration: InputDecoration(hintText: 'enter password'),
                        onChanged: (content) {
                          var passwordBloc = context.read<AuthFormBloc>();
                          passwordBloc.add(PasswordUnfocused());
                        },
                      ),
                    ),
                    BlocBuilder<AuthFormBloc, AuthFormState>(
                      builder: (context, state) {
                        if (state is PasswordSuccess) {
                          return Icon(
                            Icons.check_circle_outlined,
                            color: Colors.green,
                          );
                        } else if (state is PasswordFailure) {
                          return Icon(
                            Icons.close,
                            color: Colors.red,
                          );
                        } else {
                          return Icon(
                            Icons.check_circle_outlined,
                            color: Colors.grey,
                          );
                        }
                      },
                    ),
                  ],
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
