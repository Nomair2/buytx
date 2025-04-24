import 'package:equatable/equatable.dart';

class UserEnity extends Equatable {
  String? email;
  String? password;
  String? username;
  String? fullName;
  String? phone;
  List<String>? authProvider;

  UserEnity(
      {required this.email,
      required this.password,
      required this.username,
      required this.fullName,
      required this.phone,
      required this.authProvider});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [email, password, username, fullName, authProvider];
}
