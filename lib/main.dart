import 'package:flutter/material.dart';
import 'package:flutter_fortune/view/mypage/mypage.dart';
import 'package:flutter_fortune/view/note/post_note_meta.dart';
import 'package:flutter_fortune/view/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen(),
    );
  }
}
