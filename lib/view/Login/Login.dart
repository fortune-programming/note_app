import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune/view/New_register/New_register.dart';
import 'package:flutter_fortune/view/Resetting/Resetting.dart';
import 'package:flutter_fortune/view/mypage/mypage.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _errorMessage = '';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFE2D4BA),
        title: Center(
          child: Text(
            'ログインページ',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'ユーザー名',
                      hintText: 'ユーザー名を入力してください。',
                      suffixIcon: Padding(padding: const EdgeInsets.all(12.0),
                      child: Text('@m.mie-u.ac.jp', style: TextStyle(fontSize: 15, color: Colors.black),),)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ユーザー名を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'パスワード',
                      hintText: 'パスワードを入力してください。',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'パスワードを入力してください。';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(text: 'パスワードを忘れた方は'),
                        TextSpan(
                            text: 'こちら',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Resetting()));
                              })
                      ])),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(text: 'アカウントをお持ちでない方は'),
                        TextSpan(
                            text: 'こちら',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => New_register()));
                              })
                      ])),
                  SizedBox(height: 32.0),
                  _isLoading
                      ? CircularProgressIndicator()
                      : OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mypage()));
                          },
                          child: Text(
                            'ログイン',
                          ),
                        ),
                  SizedBox(height: 16.0),
                  Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//変更済み