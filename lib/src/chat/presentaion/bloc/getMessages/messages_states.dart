import 'package:marabh/src/chat/domain/entity/message_entity.dart';

abstract class MessagesStates {}

class MessagesLoading extends MessagesStates {}

class MessagesLoaded extends MessagesStates {
  final List<MessageEntity> messages;

  MessagesLoaded(this.messages);
}

class MessageAdded extends MessagesStates {
  final MessageEntity message;

  MessageAdded(this.message);
}

class MessagesError extends MessagesStates {
  final String message;

  MessagesError(this.message);
}
