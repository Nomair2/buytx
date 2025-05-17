import 'package:marabh/core/usercase/usecase.dart';
import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/chat/domain/entity/user_chat_entity.dart';
import 'package:marabh/src/chat/domain/repository/chat_repository.dart';

class GetChatsUseCase extends UseCase<List<UserChatEntity>, String> {
  GetChatsUseCase(this._chatRepository);
  final ChatRepository _chatRepository;
  @override
  ResultFuture<List<UserChatEntity>> call(String token) {
    return _chatRepository.getChats(token);
  }
}
