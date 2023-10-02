import 'package:flutter/material.dart';
import 'package:flutter_fortune/view/Login/Login.dart';


class ResettingPage extends StatefulWidget {
  const ResettingPage({super.key});

  @override
  State<ResettingPage> createState() => _ResettingPageState();
}

class _ResettingPageState extends State<ResettingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String userInput = "";
  bool isInputValid = false;

  bool checkInput(String input) {
    final RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
    return regex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 58,
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
                  obscureText: true,
                  onChanged: (text) {
                    setState(() {
                      userInput = text;
                      isInputValid = checkInput(userInput);
                    });
                  },
                  controller: emailController,
                  decoration: InputDecoration(hintText: 'パスワード'),
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    userInput = text;
                    isInputValid = checkInput(userInput);
                  });
                },
                controller: passController,
                decoration: InputDecoration(hintText: 'パスワード（確認用）'),
              ),
            ),
            SizedBox(height: 10),
            RichText(
              text: TextSpan(style: TextStyle(color: Colors.black), children: [
                TextSpan(text: '新しいパスワードを設定してください。'),
              ]),
            ),
            SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                if (isInputValid) {
                  print("文字列は条件を満たしています$passController");
                } else {
                  print("文字列は条件を満たしていません");
                }
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) =>LogIn())
                );

              }, 
            child: Text('完了'))
          ],
        ),
      ),
    ));
  }
}
