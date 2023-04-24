import 'package:flutter/material.dart';
import 'package:yes_no_maiby/config/helpers/get_yes_or_no.dart';
import 'package:yes_no_maiby/domain/entities/message.dart';

//  el ChangeNotifier => nos indicara cuando algo cambie
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesOrNo = GetYesOrNo();

  List<Message> messages = [
    Message(text: 'Hola mi amor', fromWho: FromWho.me),
    Message(text: 'Ya regresas del trabaji', fromWho: FromWho.me),
    Message(text: 'si', fromWho: FromWho.her),
  ];

  Future<void> herReply() async {
    final herMessage = await getYesOrNo.getData();
    messages.add(herMessage);
  }

  Future<void> sendMessage({required String textMessage}) async {
    if (textMessage.isEmpty) return;

    final newMessage = Message(text: textMessage, fromWho: FromWho.me);
    messages.add(newMessage);

    if (textMessage.endsWith('?')) {
      await herReply();
    }

    // notifcar que algo cambio
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
