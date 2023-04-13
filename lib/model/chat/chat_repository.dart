import 'package:flutter/material.dart';
import 'package:village/model/chat/chat.dart';

class ChatRepository {
  static final ChatRepository _instance = ChatRepository._single();

  ChatRepository._single();

  factory ChatRepository() {
    return _instance;
  }

  Future<List<Chat>> findAll() {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        Chat(
            content: '안녕하세요',
            image: const Image(image: AssetImage('assets/teste.jpg')),
            time: '2202',
            count: '1',
            title: '이름'),
      ];
    });
  }

  Future<Chat> save(String content) {
    return Future.delayed(const Duration(seconds: 1), () {
      return Chat(
          content: content,
          image: const Image(image: AssetImage('assets/teste.jpg')),
          time: '2202',
          count: '1',
          title: '글쓴이');
    });
  }

  Future<void> deleteById(int id) {
    return Future.delayed(const Duration(seconds: 1));
  }

  Future<Chat> update(Chat Chat) {
    return Future.delayed(const Duration(seconds: 1), () {
      return Chat;
    });
  }
}
