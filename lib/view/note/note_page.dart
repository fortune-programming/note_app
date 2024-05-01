import 'package:flutter/material.dart';
import 'package:flutter_fortune/view/note/post_note_meta.dart';

class Notepage extends StatefulWidget {
  const Notepage({super.key});

  @override
  State<Notepage> createState() => _NotepageState();
}

class _NotepageState extends State<Notepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('（授業名）のノート'),
        backgroundColor: Color(0xFFE2D4BA),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },
      backgroundColor: Color(0xFFE2D4BA),
      child: const Icon(Icons.add),
      ),
    );
  }
}