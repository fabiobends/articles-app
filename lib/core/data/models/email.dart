import 'dart:convert';

import 'package:equatable/equatable.dart';

class Email extends Equatable {
  final String value;

  const Email({
    required this.value,
  });

  Email copyWith({
    String? value,
  }) {
    return Email(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory Email.fromMap(Map<String, dynamic> map) {
    return Email(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Email.fromJson(String source) => Email.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [value];

  bool validator() {
    final emailRegex = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)+$');

    final isValid = emailRegex.hasMatch(this.value);

    return isValid;
  }
}
