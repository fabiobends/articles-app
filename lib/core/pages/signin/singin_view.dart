import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/bloc/password/password_bloc.dart';
import 'package:articles_app/core/pages/login/login_page.dart';
import 'package:articles_app/core/pages/signin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        var bloc = context.read<EmailBloc>();
        bloc.add(EmailUnfocused());
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        var bloc = context.read<PasswordBloc>();
        bloc.add(PasswordUnfocused());
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
          child: Text('SignIn Page'),
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
                child: const Image(
                  image: AssetImage('assets/book.png'),
                  height: 150,
                ),
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    EmailField(
                      emailFocusNode: _emailFocusNode,
                      bloc: context.read<EmailBloc>(),
                    ),
                    PasswordField(
                      passwordFocusNode: _passwordFocusNode,
                      bloc: context.read<PasswordBloc>(),
                    ),
                    const SizedBox(height: 20),
                    SubmitButton(),
                    TextButton(
                      child: Text("Do you have an account? Just log in!"),
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                          (route) => false,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
