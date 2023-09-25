import 'package:flutter/material.dart';

import '../Login/Login.dart';

class New_register extends StatefulWidget {
  @override
  _New_registerState createState() => _New_registerState();
}

class _New_registerState extends State<New_register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String userInput = "";
  String userInput1 = "";
  bool isInputValid = false;

  // 正規表現を使用して条件をチェックする関数
  bool checkInput(String input) {
    // 英語大文字、英語小文字、数字をそれぞれ少なくとも1文字以上使用している合計8文字以上の文字列
    final RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
    return regex.hasMatch(input);
  }

  // ポップアップを表示する関数
  void showValidationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("入力が無効です"),
          content: Text("英語大文字、英語小文字、数字をそれぞれ少なくとも1文字以上使用している合計8文字以上の文字列が必要です。"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void showValidationPopup1() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("入力が無効です"),
          content: Text("入力された内容が一致しているか確認してください"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

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
                  onChanged: (text) {
                    setState(() {
                      userInput = text;
                      isInputValid = checkInput(userInput);
                    });
                  },
                  controller: passController,
                  decoration: InputDecoration(hintText: 'パスワード'),
                ),
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    userInput1 = text;
                  });
                },
                decoration: InputDecoration(hintText: 'パスワード（確認用）'),
              ),
            ),
            SizedBox(height: 70),
            ElevatedButton(
                onPressed: () {
                  if (isInputValid) {
                    if (userInput == userInput1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    } else {
                      showValidationPopup1();
                    }
                  } else {
                    print("文字列は条件を満たしていません");
                    showValidationPopup();
                  }
                },
                child: Text('完了'))
          ],
        ),
      ),
    ));
  }
}
