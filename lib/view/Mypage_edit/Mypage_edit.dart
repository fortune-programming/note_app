import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fortune/view/Mypage/Mypage.dart';
import 'package:image_picker/image_picker.dart';

class Mypage_edit extends StatefulWidget {
  const Mypage_edit({Key? key}) : super(key: key);

  @override
  _Mypage_editState createState() => _Mypage_editState();
}

class _Mypage_editState extends State<Mypage_edit> {
  String _name = 'User name';
  String _intro = 'Introduction text';
  String _belonging = 'Belonging text';
  String? _selectedFaculty;
  String? _serlectedPicture;
  String? _selectedGread;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFE2D4BA),
        title: Center(
          child: Text(
            'マイページ編集',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16.0),
              Text(
                'アカウント名',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              TextField(
                decoration: InputDecoration(
                  hintText: '名前',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              //SizedBox(height: 16.0),
              //Text(
                //'アカウントのアイコン',
                //style: TextStyle(
                  //fontSize: 16.0,
                  //fontWeight: FontWeight.bold,
                //),
              //),
              //SizedBox(height: 8.0),
              //Container(
                //width: 80.0,
                //height: 80.0,
                //decoration: BoxDecoration(
                  //color: Colors.grey[200],
                  //borderRadius: BorderRadius.circular(40.0),
                //),
                //child: Icon(Icons.person, size: 48.0),
              //),
              //SizedBox(height: 8.0),
              //TextButton(
                //onPressed: () {
                  // Add code to change the account icon
                //},
                //child: Text('画像を変更'),
              //),
              //SizedBox(height: 16.0),
              //Text(
                //'自己紹介',
                //style: TextStyle(
                  //fontSize: 16.0,
                  //fontWeight: FontWeight.bold,
                //),
              //),
              //SizedBox(height: 8.0),
              //TextField(
                //maxLines: 3,
                //decoration: InputDecoration(
                  //hintText: '自己紹介をどうぞ',
                  //border: OutlineInputBorder(),
                //),
                //onChanged: (value) {
                  //setState(() {
                    //_intro = value;
                  //});
                //},
              //),
              SizedBox(height: 16.0),
              Text(
                '所属学部',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: '学部',
                  border: OutlineInputBorder(),
                ),
                value: _selectedFaculty,
                items: const [
                  DropdownMenuItem(
                    value: 'Faculty of humanities',
                    child: Text('人文学部'),
                  ),
                  DropdownMenuItem(
                    value: 'Faculty of education',
                    child: Text('教育学部'),
                  ),
                  DropdownMenuItem(
                    value: 'Faculty of bioresources',
                    child: Text('生物資源学部'),
                  ),
                  DropdownMenuItem(
                    value: 'Faculty of engineering',
                    child: Text('工学部'),
                  ),
                  DropdownMenuItem(
                    value: 'Faculty of medical',
                    child: Text('医学部'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedFaculty = value;
                  });
                },
              ),
             SizedBox(height: 16.0),
              Text(
                '学年',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: '学年',
                  border: OutlineInputBorder(),
                ),
                value: _selectedGread,
                items: const [
                  DropdownMenuItem(
                    value: 'Gread 1',
                    child: Text('1年'),
                  ),
                  DropdownMenuItem(
                    value: 'Gread 2',
                    child: Text('2年'),
                  ),
                  DropdownMenuItem(
                    value: 'Gread 3',
                    child: Text('3年'),
                  ),
                  DropdownMenuItem(
                    value: 'Gread 4',
                    child: Text('4年'),
                  ),
                  DropdownMenuItem(
                    value: 'Master 1',
                    child: Text('修士1年'),
                  ),
                  DropdownMenuItem(
                    value: 'Master 2',
                    child: Text('修士2年'),
                  ),
                  DropdownMenuItem(
                    value: 'Doctor 1',
                    child: Text('博士1年'),
                  ),
                  DropdownMenuItem(
                    value: 'Doctor 2',
                    child: Text('博士2年'),
                  ),
                  DropdownMenuItem(
                    value: 'Doctor 3',
                    child: Text('博士3年'),
                  ),
                  DropdownMenuItem(
                    value: 'Doctor 4',
                    child: Text('博士4年'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGread = value;
                  });
                },
              ),
              const SizedBox(height: 45.0,),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(onPressed: (){
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Mypage()));
                        }, 
                        child: Text('変更を保存'),
                        ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//変更済み
