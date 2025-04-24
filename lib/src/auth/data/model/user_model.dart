import 'package:marabh/core/utils/typedefs.dart';

class UserModel {
  int? id;
  String? email;
  String? password;
  String? username;
  String? fullName;
  String? number;
  List<String>? authProvider;

  UserModel({
    this.email,
    this.password,
    this.username,
    this.id,
    this.fullName,
    this.number,
    this.authProvider,
  });

  DataMap toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'username': username,
      'fullName': fullName,
      'number': number,
      'authProvider': authProvider?.toList(),
    };
  }

  factory UserModel.fromMap(DataMap map) {
    return UserModel(
      email: map['email'],
      password: map['password'],
      username: map['username'],
      id: map['id'],
      fullName: map['fullName'],
      number: map['number'],
      authProvider: map['authProvider'] != null
          ? List<String>.from(map['authProvider'])
          : null,
    );
  }

  static UserModel empty() {
    return UserModel();
  }

  UserModel copyWith({
    String? email,
    String? password,
    String? username,
    String? fullName,
    int? id,
    String? number,
    List<String>? authProvider,
  }) {
    return UserModel(
      email: email ?? this.email,
      id: id ?? this.id,
      password: password ?? this.password,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      number: number ?? this.number,
      authProvider: authProvider ?? this.authProvider,
    );
  }
}
