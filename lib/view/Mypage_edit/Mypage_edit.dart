import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fortune/model/account.dart';
import 'package:flutter_fortune/utils/firestore/Authentication.dart';
import 'package:flutter_fortune/utils/firestore/users.dart';
import 'package:flutter_fortune/utils/popup.dart';
import 'package:flutter_fortune/view/Mypage/Mypage.dart';
import 'package:flutter_fortune/view/screen.dart';
import 'package:image_picker/image_picker.dart';

class Mypage_edit extends StatefulWidget {
  const Mypage_edit({Key? key}) : super(key: key);

  @override
  _Mypage_editState createState() => _Mypage_editState();
}

class _Mypage_editState extends State<Mypage_edit> {
  Account myAccount = Authentication.myAccount!;
  String? _name = Authentication.myAccount?.name;
  String _intro = 'Introduction text';
  String _belonging = 'Belonging text';
  String? _selectedFaculty = Authentication.myAccount?.faculty;
  String? _serlectedPicture = Authentication.myAccount?.faculty;
  String? _selectedGread = Authentication.myAccount?.gread;

  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = Authentication.myAccount?.name ?? '';
  }

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
                controller: _nameController,
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
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text('未設定'),
                  ),
                  DropdownMenuItem(
                    value: '人文学部',
                    child: Text('人文学部'),
                  ),
                  DropdownMenuItem(
                    value: '教育学部',
                    child: Text('教育学部'),
                  ),
                  DropdownMenuItem(
                    value: '生物資源学部',
                    child: Text('生物資源学部'),
                  ),
                  DropdownMenuItem(
                    value: '工学部',
                    child: Text('工学部'),
                  ),
                  DropdownMenuItem(
                    value: '医学部',
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
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text('未設定'),
                  ),
                  DropdownMenuItem(
                    value: '1年',
                    child: Text('1年'),
                  ),
                  DropdownMenuItem(
                    value: '2年',
                    child: Text('2年'),
                  ),
                  DropdownMenuItem(
                    value: '3年',
                    child: Text('3年'),
                  ),
                  DropdownMenuItem(
                    value: '4年',
                    child: Text('4年'),
                  ),
                  DropdownMenuItem(
                    value: '修士1年',
                    child: Text('修士1年'),
                  ),
                  DropdownMenuItem(
                    value: '修士2年',
                    child: Text('修士2年'),
                  ),
                  DropdownMenuItem(
                    value: '博士1年',
                    child: Text('博士1年'),
                  ),
                  DropdownMenuItem(
                    value: '博士2年',
                    child: Text('博士2年'),
                  ),
                  DropdownMenuItem(
                    value: '博士3年',
                    child: Text('博士3年'),
                  ),
                  DropdownMenuItem(
                    value: '博士4年',
                    child: Text('博士4年'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGread = value;
                  });
                },
              ),
              const SizedBox(
                height: 45.0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                  onPressed: () async {
                    if (_name != null &&
                        _name!.length <= 20 &&
                        _selectedFaculty != null &&
                        _selectedGread != null) {
                      Account updateAccount = Account(
                          id: myAccount.id,
                          number: myAccount.number,
                          name: _name,
                          faculty: _selectedFaculty!,
                          gread: _selectedGread!);
                      Authentication.myAccount = updateAccount;
                      var result =
                          await UserFirestore.updateUser(updateAccount);
                      if (result == true) {
                        Navigator.pop(context, true);
                      }
                    } else {
                      showCustomPopup(
                          context, "変更を完了できません", "名前(20文字以内)、学部、学年を選択してください");
                    }
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
