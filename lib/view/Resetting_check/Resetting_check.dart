import 'package:flutter/material.dart';
import 'package:flutter_fortune/view/Login/Login.dart';

class Resetting_check extends StatefulWidget {
  const Resetting_check({super.key});

  @override
  State<Resetting_check> createState() => _Resetting_checkState();
}

class _Resetting_checkState extends State<Resetting_check> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'メールを送信しました',
              style: TextStyle(fontSize: 24),
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

          ],
          ) ,
          )
          );
  }
}
      //appBar: AppBar(
        //elevation: 0.0,
        //backgroundColor: Colors.transparent,
        //title: Text(
          //'メールを送信しました',
          //style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontSize: 30),
        //),
      //),
      //body: Center(
        //child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
            //children: <Widget>[
              //CheckboxListTile(
                //controlAffinity: ListTileControlAffinity.leading,
                //title:
                  //  Text('メールのURLをクリックしましたか', style: TextStyle(fontSize: 20)),
                //value: isChecked,
                //onChanged: (value) {
                  //setState(() {
                    //isChecked = !isChecked;
                  //});
                //},
              //),
              //ElevatedButton(
                //onPressed: isChecked
                  //  ? () {
                    //    Navigator.pushReplacement(context,
                      //      MaterialPageRoute(builder: (context) => LogIn()));
                      //}
                    //: null, // チェックがない場合はボタンを無効にする
                //child: Text('ログインページに戻る'),
              //),
            //]),
      //),
    //);
  //}
//}
