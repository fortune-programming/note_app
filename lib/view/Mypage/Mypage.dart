import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fortune/model/account.dart';
import 'package:flutter_fortune/view/Mypage_edit/Mypage_edit.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(222, 168, 69, 0.612),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'マイページ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[
                    Row(
                      children:[
                      SizedBox(width: 10),
                      Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        Text('ユーザー名', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Text('ユーザーの学年　ユーザーの学部', style: TextStyle(fontSize: 15),),
                       ],
                      )
                     ]
                    ),
                    OutlinedButton(onPressed: (){
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Mypage_edit()));
                    }, 
                    child: Text('編集')
                    )
                   ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
