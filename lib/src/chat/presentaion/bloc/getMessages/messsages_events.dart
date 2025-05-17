import 'package:marabh/src/chat/domain/entity/message_entity.dart';

abstract class MesssagesEvents {}

class FetchMesssagesEvent extends MesssagesEvents {
  final String id;
  FetchMesssagesEvent({required this.id});
}

class AddMessage extends MesssagesEvents {
  MessageEntity message;
  AddMessage({required this.message});
}
