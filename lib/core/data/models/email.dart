import 'package:equatable/equatable.dart';

class Email extends Equatable {
  final String value;

  const Email(this.value);

  @override
  List<Object> get props => [value];
}
