import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/data/models/models.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
    required FocusNode emailFocusNode,
    required EmailBloc bloc,
  })  : _emailFocusNode = emailFocusNode,
        _bloc = bloc,
        super(key: key);

  final FocusNode _emailFocusNode;
  final EmailBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _emailFocusNode,
      decoration: InputDecoration(hintText: 'enter email'),
      onChanged: (content) {
        _bloc.add(
          EmailChanged(
            email: Email(value: content),
          ),
        );
      },
    );
  }
}
