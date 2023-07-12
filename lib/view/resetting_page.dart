import 'package:flutter/material.dart';

class ResettingPage extends StatefulWidget {
  const ResettingPage({super.key});

  @override
  State<ResettingPage> createState() => _ResettingPageState();
}

class _ResettingPageState extends State<ResettingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 58,),
              Text('再設定ページ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'メールアドレス'
                    ),
                  ),
                ),
              ),
              Container(
                width:300,
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(
                    hintText: 'パスワード'
                  ),
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: '新しいパスワードを設定してください。'),
                  ]
                ),
              ),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {

                },
                child: Text('完了')
              )
            ],
          ),
        ),
      )
    );
  }
}