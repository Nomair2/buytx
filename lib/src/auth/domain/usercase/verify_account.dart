import 'package:equatable/equatable.dart';
import 'package:marabh/core/usercase/usecase.dart';
import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/auth/data/model/user_model.dart';
import 'package:marabh/src/auth/domain/repository/auth_repository.dart';

class VerifyAccountUseCase extends UseCase<void, String> {
  final AuthRepository _repo;

  VerifyAccountUseCase(this._repo);

  @override
  ResultFuture<void> call(String params) => _repo.verifyAccount(params);
}
