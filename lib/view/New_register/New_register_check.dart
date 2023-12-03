import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class New_register_check extends StatefulWidget {
  @override
  _New_register_checkState createState() => _New_register_checkState();
}

class _New_register_checkState extends State<New_register_check> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'メールを送信しました',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 300.0,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    if (newValue != null) {
                      setState(() {
                        isChecked = newValue;
                      });
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: isChecked
                      ? () {
                          // ボタンが押せる処理
                        }
                      : null, // チェックがない場合はボタンを無効にする
                  child: Text('次へ進む'),
                ),
                SizedBox(width: 10.0),
                Text(
                  'メールのURLをクリックした',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
