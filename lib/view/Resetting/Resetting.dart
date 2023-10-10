import 'package:flutter/material.dart';
import 'package:flutter_fortune/view/Login/Login.dart';


class Resetting extends StatefulWidget {
  const Resetting({super.key});

  @override
  State<Resetting> createState() => _ResettingState();
}

class _ResettingState extends State<Resetting> {
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
            SizedBox(
              height: 50,
            ),
            Text(
              '再設定ページ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                width: 300,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'メールアドレス'),
                ),
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                //Navigator.pushReplacement(
                  //context, 
                  //MaterialPageRoute(builder: (context) => ())
                //);

              }, 
            child: Text('メールを送信'))
          ],
        ),
      ),
    ));
  }
}
