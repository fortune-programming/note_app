import 'package:flutter/material.dart';

class Notepage_notbutton extends StatefulWidget {
  const Notepage_notbutton({super.key});

  @override
  State<Notepage_notbutton> createState() => _Notepage_notbuttonState();
}

class _Notepage_notbuttonState extends State<Notepage_notbutton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('（ユーザー名）さんの（授業名）のノート'),
        backgroundColor: Color(0xFFE2D4BA),
      ),
    );
  }
}