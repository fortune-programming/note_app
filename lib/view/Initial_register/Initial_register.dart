import 'package:flutter/material.dart';

import '../Authentication/Authentication.dart';

class InitialRegister extends StatefulWidget {

  @override
  _InitialRegisterState createState() => _InitialRegisterState();
}

class _InitialRegisterState extends State<InitialRegister> {
    TextEditingController emailController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("ノート共有アプリへようこそ！",style: TextStyle(fontSize: 24, fontWeight:FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'メールアドレス',
                      suffixIcon: Padding(padding: const
                      EdgeInsets.all(12.0),
                        child: Text('@m.mie-u.ac.jp',style: TextStyle(color: Colors.black),),
                      ),
                     ),
                  ),
                ),
              ),
              SizedBox(height: 70,),
               ElevatedButton(onPressed: () {
                Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Authentication()));
               }, 
               child: Text('認証コードを送信')),
            ],
          ),
        ),
      )
    );
  }
}
