import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fortune/model/account.dart';
import 'package:flutter_fortune/utils/firestore/Authentication.dart';
import 'package:flutter_fortune/view/Mypage_edit/Mypage_edit.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  Account myAccount = Authentication.myAccount!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFE2D4BA),
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
                      if(myAccount.name == null && myAccount.id == null && myAccount.faculty == null && myAccount.gread == null)
                        child: Text('アカウントを設定してください')
                      else(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(myAccount.name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            Text('@${myAccount.id}'),
                            Text(myAccount.faculty),
                            Text(myAccount.gread),
                          ],
                        ),
                      ),
                     ],
                    ),
                     OutlinedButton(onPressed: (){
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Mypage_edit()));
                      }, 
                      child: Text('編集')
                      )
                  ]
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
