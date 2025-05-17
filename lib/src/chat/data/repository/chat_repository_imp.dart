import 'package:dartz/dartz.dart';
import 'package:marabh/core/error/exceptions.dart';
import 'package:marabh/core/error/failure.dart';
import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/chat/data/model/message_model.dart';
import 'package:marabh/src/chat/data/model/user_chat_model.dart';
import 'package:marabh/src/chat/data/source/chat_remote_data_source.dart';
import 'package:marabh/src/chat/domain/entity/message_entity.dart';
import 'package:marabh/src/chat/domain/entity/user_chat_entity.dart';
import 'package:marabh/src/chat/domain/repository/chat_repository.dart';
import 'package:marabh/src/chat/domain/usecases/get_messages.dart';

class ChatRepositoryImp extends ChatRepository {
  ChatRepositoryImp(this._chatRemoteDataSource);

  final ChatRemoteDataSource _chatRemoteDataSource;

  @override
  ResultFuture<List<UserChatEntity>> getChats(String token) async {
    print("in bloc repository data 1 ");
    try {
      final List<UserChatModel> dataReturn =
          await _chatRemoteDataSource.getChats(token);
      List<UserChatEntity> data = convertToList(dataReturn);
      print("in bloc repository data 2 ");
      return Right(data);
    } on ServerExceptions catch (e) {
      print("in bloc repository data 3 ");
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<MessageEntity>> getMessages(MessageParms parms) async {
    print("in bloc repository data 1 ");
    try {
      final List<MessageModel> dataReturn =
          await _chatRemoteDataSource.getMessages(parms);
      List<MessageEntity> data = fromMessageModel(dataReturn);
      print("in bloc repository data 2 ");
      return Right(data);
    } on ServerExceptions catch (e) {
      print("in bloc repository data 3 ");
      return Left(ServerFailure.fromException(e));
    }
  }
}
