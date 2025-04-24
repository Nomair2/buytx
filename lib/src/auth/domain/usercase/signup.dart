import 'package:equatable/equatable.dart';
import 'package:marabh/core/usercase/usecase.dart';
import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/auth/domain/entity/user.dart';
import 'package:marabh/src/auth/domain/repository/auth_repository.dart';

class SignupUseCase extends UseCase<void, UserEnity> {
  final AuthRepository _repo;

  SignupUseCase(this._repo);

  @override
  ResultFuture<void> call(UserEnity params) => _repo.signup(params);
}
