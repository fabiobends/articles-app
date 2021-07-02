import 'package:articles_app/core/bloc/email/email_bloc.dart';
import 'package:articles_app/core/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Row(
      children: [
        Flexible(
          child: TextFormField(
            focusNode: _emailFocusNode,
            decoration: InputDecoration(hintText: 'enter email'),
            onChanged: (content) {
              _bloc.add(
                EmailChanged(
                  email: Email(value: content),
                ),
              );
            },
          ),
        ),
        BlocBuilder<EmailBloc, EmailState>(
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
    );
  }
}
