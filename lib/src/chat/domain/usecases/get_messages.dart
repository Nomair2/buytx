import 'package:marabh/core/usercase/usecase.dart';
import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/chat/domain/entity/message_entity.dart';
import 'package:marabh/src/chat/domain/entity/user_chat_entity.dart';
import 'package:marabh/src/chat/domain/repository/chat_repository.dart';

class GetMessagesUseCase extends UseCase<List<MessageEntity>, MessageParms> {
  GetMessagesUseCase(this._chatRepository);
  final ChatRepository _chatRepository;
  @override
  ResultFuture<List<MessageEntity>> call(MessageParms id) {
    return _chatRepository.getMessages(id);
  }
}

class MessageParms {
  final String id;
  final String token;
  MessageParms(this.id, this.token);
}
