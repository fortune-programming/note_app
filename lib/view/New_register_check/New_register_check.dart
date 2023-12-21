import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login/Login.dart';
import '../../utils/firestore/Authentication.dart';

class New_register_check extends StatefulWidget {
  final String email;
  final String pass;
  New_register_check({required this.email, required this.pass});
  @override
  _New_register_checkState createState() => _New_register_checkState();
}

class _New_register_checkState extends State<New_register_check> {
  bool isChecked = false;

  void showValidationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("メール認証が完了していません"),
          content: Text("入力したメールアドレスに届いたメールのURLをクリックしてください"),
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
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'メールを送信しました',
                style:
                    TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: 300,
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text('メールのURLをクリックしましたか',
                          style: TextStyle(fontSize: 20)),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),
                    OutlinedButton(
                      onPressed: isChecked
                          ? () async {
                              var result = await Authentication.emailSignIn(
                                  email: widget.email, pass: widget.pass);
                              if (result is UserCredential) {
                                if (result.user!.emailVerified == true) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogIn()));
                                } else {
                                  print("メール認証が完了していません");
                                  showValidationPopup();
                                }
                              }
                            }
                          : null, // チェックがない場合はボタンを無効にする
                      child: Text('ログインページに戻る'),
                    ),
                  ]),
            ],
          ),
        ));
  }
}
