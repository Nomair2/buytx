import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/auth/domain/entity/userRequest.dart';
import 'package:marabh/src/auth/domain/entity/user_data_enetity.dart';

abstract class AuthRepository {
  ResultFuture<void> signup(UserRequestEnity user);

  ResultFuture<UserEntity> login(String email, String password);

  ResultFuture<void> verifyOtp(String email, String otp);

  ResultFuture<void> verifyAccount(String email);
}
