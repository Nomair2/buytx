import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/chat/domain/entity/message_entity.dart';
import 'package:marabh/src/chat/domain/entity/user_chat_entity.dart';
import 'package:marabh/src/chat/domain/usecases/get_messages.dart';

abstract class ChatRepository {
  ResultFuture<List<UserChatEntity>> getChats(String token);

  ResultFuture<List<MessageEntity>> getMessages(MessageParms params);
}
