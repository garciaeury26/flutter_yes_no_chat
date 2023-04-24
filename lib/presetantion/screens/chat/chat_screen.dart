import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maiby/domain/entities/message.dart';
import 'package:yes_no_maiby/presetantion/providers/chat_provider.dart';
import 'package:yes_no_maiby/presetantion/widgets/chat/her_message_buble.dart';
import 'package:yes_no_maiby/presetantion/widgets/chat/my_message_buble.dart';
import 'package:yes_no_maiby/presetantion/widgets/shared/message_input.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi amor'),
          // centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.b22e0c0a46a04b3b440a55e74f75a879?rik=iKy0AFG9jCJPEg&riu=http%3a%2f%2fcelebmafia.com%2fwp-content%2fuploads%2f2014%2f08%2falexandra-daddario-photoshoot-by-g.-cates-2014-_3.jpg&ehk=%2b4HEbsiczUEkmaDbVJ2x4AyvCnnMjnywB%2f%2fBF7ePWjM%3d&risl=&pid=ImgRaw&r=0'),
            ),
          ),
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtener el context del provider
    final chatProvider = context.watch<ChatProvider>();

    // espacio para los bottones y etc
    return SafeArea(
      child: Column(// para poner elementos debajo de otro
          children: [
        Expanded(
          // para que tome el 100% de la pantalla
          //child: Container(  es como un divcolor: Colors.blueAccent ),
          child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messages.length, // opcional => default => infinito
            itemBuilder: (context, index) {
              final message = chatProvider.messages[index];
              return (message.fromWho == FromWho.her)
                  ?  HerMessageBuble(herResponse: message,)
                  : MyMessageBuble(
                      messageText: message,
                  );
            },
          ),
        ),
        MessageInput(onValue: (value) => chatProvider.sendMessage(textMessage: value)),
      ]),
    );
  }
}
