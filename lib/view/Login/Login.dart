import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _errorMessage = '';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'ユーザー名',
                    hintText: 'ユーザー名を入力してください。',
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
                SizedBox(height: 32.0),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(226, 212, 186, 100)),
                        onPressed: () {
                          backgroundColor:
                          Color(0xFFE2D4BA);
                        },
                        child: Text(
                          'ログイン',
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
    );
  }
}
//変更済み