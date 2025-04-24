import 'package:dartz/dartz.dart';
import 'package:marabh/core/error/exceptions.dart';
import 'package:marabh/core/error/failure.dart';
import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/auth/data/source/auth_remote_data_source.dart';
import 'package:marabh/src/auth/domain/entity/user.dart';
import 'package:marabh/src/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  AuthRepositoryImp(this._authRemoteDataSource);
  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  ResultFuture<void> login(String email, String password) async {
    print("in bloc repository data 1 ");
    try {
      await _authRemoteDataSource.login(email, password);
      print("in bloc repository data 2 ");
      return const Right(null);
    } on ServerExceptions catch (e) {
      print("in bloc repository data 3 ");
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> signup(UserEnity user) async {
    try {
      await _authRemoteDataSource.signup(user);
      return const Right(null);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> verifyAccount(String email) async {
    try {
      await _authRemoteDataSource.verifyAccount(email);
      return const Right(null);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> verifyOtp(String email, String otp) async {
    print("in bloc repository data 1 ");
    try {
      print("in bloc repository data 2 ");
      await _authRemoteDataSource.verifyOtp(email, otp);
      return const Right(null);
    } on ServerExceptions catch (e) {
      print("in bloc repository data 3 ");
      return Left(ServerFailure.fromException(e));
    }
  }
}
