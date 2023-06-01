import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune/main.dart';
import 'package:flutter_fortune/view/mypage/mypage_edit.dart';
import 'package:flutter_fortune/view/note/post_note_meta.dart';

import 'mypage/mypage.dart';
import 'timeline/timeline.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  int selectedIndex =0;
  List<Widget>pageList = [Timeline(), mypage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label: ''
          )
        ],
        currentIndex: selectedIndex,  
        onTap: (index){
          setState((){
            selectedIndex=index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: Icon(Icons.chat_bubble_outline),
          ),
    );
  }
}