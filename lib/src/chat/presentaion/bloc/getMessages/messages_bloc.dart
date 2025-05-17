import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marabh/core/common/singletons/cache_helper.dart';
import 'package:marabh/core/error/failure.dart';
import 'package:marabh/core/services/injection_container.dart';
import 'package:marabh/src/chat/domain/entity/message_entity.dart';
import 'package:marabh/src/chat/domain/usecases/get_messages.dart';
import 'package:marabh/src/chat/presentaion/bloc/getMessages/messages_states.dart';
import 'package:marabh/src/chat/presentaion/bloc/getMessages/messsages_events.dart';

class messagesBloc extends Bloc<MesssagesEvents, MessagesStates> {
  List<MessageEntity> messages = [];
  messagesBloc() : super(MessagesLoading()) {
    on<FetchMesssagesEvent>(_fetchmessagess);
    on<AddMessage>(_addMessage);
  }

  _addMessage(AddMessage event, emit) {
    emit(MessageAdded(event.message));
  }

  _fetchmessagess(event, emit) async {
    print("in bloc code 1 ");
    if (event is FetchMesssagesEvent) {
      String? token = sl<CacheHelper>().getSessionToken();
      print("in bloc code 2 ");
      Either<Failure, List<MessageEntity>> dataReturn =
          await sl<GetMessagesUseCase>().call(MessageParms(event.id, token!));
      dataReturn.fold((Failure failuer) {
        print("in bloc code 3 ");
        emit(MessagesError(failuer.errorMessage));
      }, (r) {
        print("in bloc code 4 ");
        messages = r;
        emit(MessagesLoaded(r));
      });
    }
    print("in bloc code is not current event ");
  }
}
