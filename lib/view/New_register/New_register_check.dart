import 'package:flutter/material.dart';
import '../Login/Login.dart';

class New_register_check extends StatefulWidget {
  @override
  _New_register_checkState createState() => _New_register_checkState();
}

class _New_register_checkState extends State<New_register_check> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'メールを送信しました',
          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title:
                    Text('メールのURLをクリックしましたか', style: TextStyle(fontSize: 20)),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
              ),
              ElevatedButton(
                onPressed: isChecked
                    ? () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      }
                    : null, // チェックがない場合はボタンを無効にする
                child: Text('ログインページに戻る'),
              ),
            ]),
      ),
    );
  }
}
