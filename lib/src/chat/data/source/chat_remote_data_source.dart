import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marabh/core/error/exceptions.dart';
import 'package:marabh/core/utils/constant/network_constants.dart';
import 'package:marabh/core/utils/error_response.dart';
import 'package:marabh/core/utils/typedefs.dart';
import 'package:marabh/src/chat/data/model/message_model.dart';
import 'package:marabh/src/chat/data/model/user_chat_model.dart';
import 'package:http/http.dart' as http;
import 'package:marabh/src/chat/domain/usecases/get_messages.dart';

abstract class ChatRemoteDataSource {
  Future<List<UserChatModel>> getChats(String token);

  Future<List<MessageModel>> getMessages(MessageParms params);
}

const Get_Chat_ENDPOINT = 'chats/MyChats';
const Get_message_ENDPOINT = 'chats/getMessages';

class ChatRemoteDataSourceImp extends ChatRemoteDataSource {
  ChatRemoteDataSourceImp(this._client);
  final http.Client _client;
  @override
  Future<List<UserChatModel>> getChats(String token) async {
    print("in bloc source data 1 ");
    try {
      final url = Uri.parse('${NetworkConstants.baseUrl}$Get_Chat_ENDPOINT');
      print("in bloc source data 2 ");
      final response = await _client.get(
        url,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjFmYTY1OGQ3NmZlOTJiN2E5ZTA5MiIsImlhdCI6MTc0NzMxOTg3OH0._HOk6zkD9A4K2JYe4kQI7Bb_moddCDB-b-KIXMr9Rrk',
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode != 200) {
        print("in bloc source data 3 ");
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerExceptions(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      final dataReturn = jsonDecode(response.body) as List;
      final userChatModels =
          dataReturn.map((json) => UserChatModel.fromMap(json)).toList();
      print("in bloc source data 4 ");
      return userChatModels;
    } on ServerExceptions {
      rethrow;
    } catch (e, s) {
      print("in bloc source data 5 ");
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerExceptions(message: 'please , try again ', statusCode: 500);
    }
  }

  @override
  Future<List<MessageModel>> getMessages(MessageParms params) async {
    print("in bloc source data 1 ");
    print(params.id);
    try {
      final url = Uri.parse(
          '${NetworkConstants.baseUrl}$Get_message_ENDPOINT/${params.id}/0');
      print("in bloc source data 2 ");
      final response = await _client.get(
        url,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ZjFmYTY1OGQ3NmZlOTJiN2E5ZTA5MiIsImlhdCI6MTc0NzMxOTg3OH0._HOk6zkD9A4K2JYe4kQI7Bb_moddCDB-b-KIXMr9Rrk',
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode != 200) {
        print("in bloc source data 3 ");
        final payload = jsonDecode(response.body) as DataMap;
        final errorResponse = ErrorResponse.fromMap(payload);
        throw ServerExceptions(
            message: errorResponse.errorMessage,
            statusCode: response.statusCode);
      }
      final dataReturn = jsonDecode(response.body) as List;
      print("1");
      print(
          "the type of message from source code is ${dataReturn[0].runtimeType}");
      final userChatModels = parseMessages(dataReturn);
      print("in bloc source data 4 ");
      return userChatModels;
    } on ServerExceptions {
      rethrow;
    } catch (e, s) {
      print("in bloc source data 5 ");
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      throw ServerExceptions(message: 'please , try again ', statusCode: 500);
    }
  }
}
