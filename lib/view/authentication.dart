import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sns/view/screen.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController authenticationContoroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text('届いた認証コードを入力してください', style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:20.0),
                child: Container(
                  width:300,
                  child: TextField(
                    controller: authenticationContoroller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 6,
                    decoration: InputDecoration(
                      hintText: '6桁の認証コード',
                      counterText: '',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100,),
              ElevatedButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Screen()));
              }, 
              child: Text('認証する'))
            ],
          ),
        ),
      ),
    );
  }
}