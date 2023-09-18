import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fortune/model/account.dart';

class mypage extends StatefulWidget {
  const mypage({super.key});

  @override
  State<mypage> createState() => _mypageState();
}

class _mypageState extends State<mypage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(226, 212, 186, 100),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'マイページ',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
      body: SafeArea(
        child:Column(
          children: [
            Container(
              height: 200,

            )
          ],) ),
    );
  }
}