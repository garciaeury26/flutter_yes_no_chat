import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maiby/presetantion/providers/chat_provider.dart';
import 'package:yes_no_maiby/presetantion/screens/chat/chat_screen.dart';

import 'config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    // en volver la aplicacicion con el provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yes no Maybe',
        theme: AppTheme(pSelctedColor: 2).theme(),
        home:const ChatScreen()
      ),
    );
  }
}