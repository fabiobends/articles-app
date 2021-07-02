import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/bloc/password/password_bloc.dart';
import 'package:articles_app/core/bloc/auth_form/auth_form_bloc.dart';
import 'package:articles_app/core/pages/index/index_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthFormBloc, AuthFormState>(
      listener: (context, state) {
        if (state is FormSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Everything okay'),
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => IndexPage(),
            ),
          );
        } else if (state is FormFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        } else {}
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            final emailBloc = context.read<EmailBloc>();
            final passwordBloc = context.read<PasswordBloc>();
            final formBloc = context.read<AuthFormBloc>();
            formBloc.add(
              FormSent(
                email: emailBloc.state.email,
                password: passwordBloc.state.password,
              ),
            );
          },
          child: const Text('Login'),
        );
      },
    );
  }
}
