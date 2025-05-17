import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marabh/src/chat/presentaion/bloc/getChat/chat_bloc.dart';
import 'package:marabh/src/chat/presentaion/bloc/getChat/chat_events.dart';
import 'package:marabh/src/chat/presentaion/bloc/getChat/chat_state.dart';
import 'package:marabh/src/chat/presentaion/widgets/custom_chat_card.dart';
import 'package:marabh/src/chat/presentaion/widgets/custom_chat_shimmer.dart';
import 'package:marabh/src/chat/presentaion/widgets/custom_search_chat.dart';

class AllChatPage extends StatelessWidget {
  const AllChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider<ChatBloc>(
      create: (context) => ChatBloc()..add(FetchChats()),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              const CustomSearchChat(),
              SizedBox(
                height: size.height * 0.04,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'المحادثات',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 66,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25))),
                  ),
                  BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      if (state is ChatLoading) {
                        return CustomChatShimmer();
                      } else if (state is ChatLoaded) {
                        final chats = state.chats;
                        return SizedBox(
                          height: size.height * 0.72,
                          child: ListView.builder(
                              itemCount: chats.length,
                              itemBuilder: (context, index) =>
                                  CustomChatCard(chats: chats[index])),
                        );
                      } else {
                        return Container();
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
