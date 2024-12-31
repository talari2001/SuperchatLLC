import 'package:flutter/material.dart';
//import 'package:signup_page/view/pages/sign_up_page.dart';
//import 'package:signup_page/view/pages/splash_screen.dart';
// import 'package:signup_page/view/pages/chat_screenI.dart';
import 'package:signup_page/view/pages/chat_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen2(),
    );
  }
}
