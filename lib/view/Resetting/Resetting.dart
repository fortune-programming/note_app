import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune/view/Login/Login.dart';
import 'package:flutter_fortune/view/Resetting_check/Resetting_check.dart';

class Resetting extends StatefulWidget {
  const Resetting({super.key});

  @override
  State<Resetting> createState() => _ResettingState();
}

class _ResettingState extends State<Resetting> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void showValidationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("入力エラー"),
          content: Text("登録されていないメールアドレスです"),
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFE2D4BA),
          title: Center(
            child: Text(
              '再設定ページ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                //SizedBox(
                //height: 50,
                //),
                //Text(
                //'再設定ページ',
                //style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                //),
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
                SizedBox(height: 70),
                OutlinedButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Resetting_check()));
                        print("パスワードリセット用のメールを送信しました");
                      } catch (e) {
                        showValidationPopup();
                        print(e);
                      }
                    },
                    child: Text('メールを送信'))
              ],
            ),
          ),
        ));
  }
}
