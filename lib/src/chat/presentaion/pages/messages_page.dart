import 'dart:convert';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marabh/core/common/singletons/cache_helper.dart';
import 'package:marabh/core/services/injection_container.dart';
import 'package:marabh/core/services/route/router.dart';
import 'package:marabh/src/chat/data/model/message_model.dart';
import 'package:marabh/src/chat/data/model/receiv_message_model.dart';
import 'package:marabh/src/chat/domain/entity/message_entity.dart';
import 'package:marabh/src/chat/presentaion/bloc/chatsocket/socket_bloc.dart';
import 'package:marabh/src/chat/presentaion/bloc/chatsocket/socket_event.dart';
import 'package:marabh/src/chat/presentaion/bloc/getChat/chat_bloc.dart';
import 'package:marabh/src/chat/presentaion/bloc/getMessages/messages_bloc.dart';
import 'package:marabh/src/chat/presentaion/bloc/getMessages/messages_states.dart';
import 'package:marabh/src/chat/presentaion/bloc/getMessages/messsages_events.dart';
import 'package:marabh/src/home/widgets/customCircularButton.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessagesScreen extends StatefulWidget {
  String? id;
  MessagesScreen({super.key, required this.id});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController sendField = TextEditingController();
  late IO.Socket socket;
  ScrollController controller = ScrollController();
  List<MessageEntity> messages = [];
  String myId = '67f1fa658d76fe92b7a9e092';

  @override
  void initState() {
    connectSocket();
    super.initState();
  }

  setMessage(MessageEntity message) {
    messagesBloc bloc = messagesBloc();
    bloc.add(AddMessage(message: message));
    // setState(() {
    //   messages.add(message);
    // });
  }

  connectSocket() {
    try {
      print("Starting socket connection...");
      String? token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjFmYTY1OGQ3NmZlOTJiN2E5ZTA5MiIsImlhdCI6MTc0NzMxOTg3OH0._HOk6zkD9A4K2JYe4kQI7Bb_moddCDB-b-KIXMr9Rrk";

      socket = IO.io(
          "https://professional-audrye-mohammedalakkhras-c3be0efd.koyeb.app",
          IO.OptionBuilder()
              .setTransports(['websocket'])
              .enableAutoConnect()
              .enableForceNew()
              .setAuth({'token': token})
              .build());

      // Add connection event handlers
      socket.onConnect((_) {
        print("Socket Connected Successfully!");
        print("Socket ID: ${socket.id}");
        print("Connection Status: ${socket.connected}");

        // Emit signin after successful connection
        socket.emit('signin', token);
      });

      socket.onConnectError((data) {
        print("Connection Error: $data");
      });

      socket.onDisconnect((_) {
        print("Socket Disconnected!");
      });

      socket.onError((error) {
        print("Socket Error: $error");
      });

      // Set up message receive listener
      socket.on('LoadNewMessage', (data) {
        print(data);
        print(data.runtimeType);
        print(data['content'].runtimeType);
        print(data['content']);
        print(data['_id']);
        print(data['receiver']);
        print(data['sentAt']);
        print(data['status']);
        print(data['sender']);
        print(data['sender']['_id']);
        setMessage(MessageEntity(
          content: data['content'],
          sentAt: DateTime.parse(data['sentAt']),
          id: data['_id'],
          receiver: data['receiver'],
          status: data['status'],
          sender: data['sender']['_id'],
        ));
        // ReceiveMessageModel receiveMessage =
        //     ReceiveMessageModel.fromMap(json.decode(data.toString()));
        // set
      });

      socket.on(
        'receive',
        (data) {
          print("Received message:");
          print(data);
        },
      );

      socket.on(
        'messageDelivered',
        (data) => print("Message delivered: $data"),
      );

      socket.on(
        'messageRead',
        (data) => print("Message read: $data"),
      );

      print("Attempting socket connection...");
      socket.connect();
    } catch (e) {
      print("Error in connectSocket: $e");
    }
  }

  sendMessage() {
    if (sendField.text.trim().isEmpty) return;

    print("Sending message to: ${widget.id}");
    socket.emit('sendMessage', {
      'content': sendField.text.trim(),
      'receiver': widget.id,
    });

    // setState(() {
    //   messages.add(MessageEntity(
    //     content: sendField.text.trim(),
    //     receiver: widget.id,
    //     sender: myId,
    //   ));
    // });

    // Clear the input field after sending
    sendField.clear();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(widget.id);
    return MultiBlocProvider(
      providers: [
        BlocProvider<messagesBloc>(
          create: (context) =>
              messagesBloc()..add(FetchMesssagesEvent(id: widget.id!)),
        ),
        BlocProvider(
          create: (context) => SocketBloc()..add(ConnectSocket()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        // color: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              // margin: EdgeInsets.only(bottom: 4),
              padding: const EdgeInsets.only(top: 10),
              height: size.height * 0.14,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        offset: const Offset(0, 1),
                        blurRadius: 1,
                        color: Colors.black.withOpacity(0.3)),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('أغيد علوان',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "متصل",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Container(
                    height: 44,
                    margin: const EdgeInsets.only(right: 20),
                    width: 44,
                    child: CustomSmallButton(
                      colorIcon: Colors.black,
                      colors: Colors.white,
                      radius: 12,
                      icons: Icons.more_vert,
                      onPressed: () {},
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Theme.of(context).colorScheme.onSurface,
                child: BlocConsumer<messagesBloc, MessagesStates>(
                  listener: (context, state) {
                    print("111");
                    if (state is MessageAdded) {
                      messages.add(state.message);
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<messagesBloc, MessagesStates>(
                      builder: (context, state) {
                        print("222");
                        if (state is MessagesLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is MessagesLoaded) {
                          print("333");
                          messages = state.messages.reversed.toList();
                          return ListView(
                              reverse: true,
                              children: List.generate(
                                messages.length,
                                (index) => ChatBubble(
                                    isSentByMe:
                                        widget.id == messages[index].receiver
                                            ? false
                                            : true,
                                    text: messages[index].content!),
                              ));
                        }
                        return Container();
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 15),
              height: size.height * 0.13,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.right,
                        controller: sendField,
                        cursorColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                sendMessage();
                              },
                              icon: Icon(
                                Icons.send_outlined,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              )),
                          hintText: 'اكتب رسالتك هنا...',
                          hintStyle:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                              borderRadius: BorderRadius.circular(25)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                              borderRadius: BorderRadius.circular(25)),
                          border: const OutlineInputBorder(),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.attach_file,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.mic_none_sharp,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSentByMe;
  final String text;

  const ChatBubble({super.key, required this.isSentByMe, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
              isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.6,
                ),
                margin: const EdgeInsets.only(bottom: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: isSentByMe ? Theme.of(context).primaryColor : null,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1.5)),
                child: isSentByMe
                    ? Text(text,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))
                    : Text(text,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ))),
            Container(
                width: 80,
                height: 25,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: isSentByMe
                    ? const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '11.40',
                            style: TextStyle(color: Color(0xff8C8C8C)),
                          ),
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 20,
                          ),
                        ],
                      )
                    : const Center(
                        child: Text(
                          '11.40',
                          style: TextStyle(color: Color(0xff8C8C8C)),
                        ),
                      ))
          ],
        ),
      ),
    );
  }
}
