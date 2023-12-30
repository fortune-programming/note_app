import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/firestore/Authentication.dart';
import '../../utils/popup.dart';
import '../New_register_check/New_register_check.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE2D4BA),
          title: Center(
            child: Text(
              '新規登録ページ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      width: 300,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'メールアドレス',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              '@m.mie-u.ac.jp',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                  OutlinedButton(
                      onPressed: () async {
                        if (isInputValid) {
                          if (userInput == userInput1) {
                            String emailPrefix = emailController.text;
                            String fullEmail = '$emailPrefix@m.mie-u.ac.jp';
                            var result = await Authentication.signUp(
                                email: fullEmail, pass: passController.text);
                            if (result is UserCredential) {
                              result.user!.sendEmailVerification();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => New_register_check(
                                          email: fullEmail,
                                          pass: passController.text)));
                            } else {
                              showCustomPopup(
                                  context, "メール送信エラー", "メールアドレスを正しく入力してください");
                            }
                          } else {
                            showCustomPopup(context, "入力が無効です",
                                "入力されたパスワードが一致しているか確認してください");
                          }
                        } else {
                          print("文字列は条件を満たしていません");
                          showCustomPopup(context, "入力が無効です",
                              "英語大文字、英語小文字、数字をそれぞれ少なくとも1文字以上使用している合計8文字以上のパスワードが必要です。");
                        }
                      },
                      child: Text('認証メールを送信'))
                ],
              ),
            ),
          ),
        ));
  }
}
