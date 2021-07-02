import 'package:articles_app/core/bloc/password/password_bloc.dart';
import 'package:articles_app/core/data/models/models.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required FocusNode passwordFocusNode,
    required PasswordBloc bloc,
  })  : _passwordFocusNode = passwordFocusNode,
        _bloc = bloc,
        super(key: key);

  final FocusNode _passwordFocusNode;
  final PasswordBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(hintText: 'enter password'),
      onChanged: (content) {
        _bloc.add(
          PasswordChanged(
            password: Password(value: content),
          ),
        );
      },
      obscureText: true,
    );
  }
}
