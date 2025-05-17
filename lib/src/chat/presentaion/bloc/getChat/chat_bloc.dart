import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marabh/core/common/singletons/cache_helper.dart';
import 'package:marabh/core/error/failure.dart';
import 'package:marabh/core/services/injection_container.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_state.dart';
import 'package:marabh/src/chat/domain/entity/user_chat_entity.dart';
import 'package:marabh/src/chat/domain/usecases/get_chats.dart';
import 'package:marabh/src/chat/presentaion/bloc/getChat/chat_events.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatLoading()) {
    on<FetchChats>(_fetchChats);
  }

  _fetchChats(FetchChats event, Emitter emit) async {
    print("in bloc code 1 ");
    emit(ChatLoading());
    String? token = sl<CacheHelper>().getSessionToken();
    print("in bloc code 2 ");
    Either<Failure, List<UserChatEntity>> dataReturn =
        await sl<GetChatsUseCase>().call(token!);
    dataReturn.fold((Failure failuer) {
      print("in bloc code 3 ");
      emit(ChatError(failuer.errorMessage));
    }, (r) {
      print("in bloc code 4 ");
      emit(ChatLoaded(r));
    });
    print("in bloc code is not current event ");
  }
}
