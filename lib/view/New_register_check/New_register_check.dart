import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune/utils/firestore/users.dart';
import 'package:flutter_fortune/utils/popup.dart';
import '../../model/account.dart';
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
                      title: Text('送信したメールのURLをクリックしましたか',
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
                                  String number = widget.email
                                      .replaceAll(RegExp(r'@.*'), '');
                                  Account newAccount = Account(
                                      id: result.user!.uid,
                                      number: number,
                                      name: null,
                                      faculty: null,
                                      gread: null);
                                  var _result =
                                      await UserFirestore.setUser(newAccount);
                                  if (_result == true) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LogIn()));
                                  }
                                } else {
                                  print("メール認証が完了していません");
                                  showCustomPopup(context, "メール認証が完了していません",
                                      "入力したメールアドレスに届いたメールのURLをクリックしてください");
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
