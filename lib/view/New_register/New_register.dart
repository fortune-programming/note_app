import 'package:flutter/material.dart';

class New_register extends StatefulWidget {
  @override
  _New_registerState createState() => _New_registerState();
}

class _New_registerState extends State<New_register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 58,
            ),
            Text(
              '新規登録ページ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: 300,
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(hintText: 'パスワード'),
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                decoration: InputDecoration(hintText: 'パスワード（確認用）'),
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(onPressed: () {}, child: Text('完了'))
          ],
        ),
      ),
    ));
  }
}
