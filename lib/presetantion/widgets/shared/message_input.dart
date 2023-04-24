import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageInput extends StatelessWidget {

  // para enviar el valor ingresado por el usuario a otra clase
  final ValueChanged<String> onValue;

  const MessageInput({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final textController = TextEditingController();

    final colors = Theme.of(context).colorScheme;

    final outlineInputBoder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        filled: true,
        enabledBorder: outlineInputBoder,
        focusedBorder: outlineInputBoder,
        hintText: 'End your message with  a "?"',
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        ));

    return TextFormField(
      // keyboardAppearance: ,
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      // quitar foco al cliclar a fuera
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      onFieldSubmitted: (value) {
        // borrar campo de texto
        textController.clear();
        // mantener el teclado activo para que no se cierre
        focusNode.requestFocus();

        onValue(value);
      },
    );
  }
}
