import 'dart:convert';

import 'package:equatable/equatable.dart';

class Password extends Equatable {
  final String value;

  const Password({
    required this.value,
  });

  Password copyWith({
    String? value,
  }) {
    return Password(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory Password.fromMap(Map<String, dynamic> map) {
    return Password(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Password.fromJson(String source) =>
      Password.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [value];

  bool validator() {
    if (this.value.length >= 8) {
      return true;
    } else {
      return false;
    }
  }
}
