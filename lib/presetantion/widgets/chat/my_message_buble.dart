import 'package:flutter/material.dart';
import 'package:yes_no_maiby/domain/entities/message.dart';

class MyMessageBuble extends StatelessWidget {
  final Message messageText ;

  const MyMessageBuble({super.key,required this.messageText});

  @override
  Widget build(BuildContext context) {
    // esto toma el color que le mandamos a nuestro thema de material en el main
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              messageText.text,
              style:const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
