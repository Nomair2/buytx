import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/auth/domain/entity/user.dart';

abstract class AuthRepository {
  ResultFuture<void> signup(UserEnity user);

  ResultFuture<void> login(String email, String password);

  ResultFuture<void> verifyOtp(String email, String otp);

  ResultFuture<void> verifyAccount(String email);
}
