import 'dart:io';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController2 = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController facultyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(226, 212, 186, 100),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            '初期登録',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'ユーザー名'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: 200,
                    height: 40,
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'emailアドレス'),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextField(
                    controller: passController,
                    decoration: InputDecoration(hintText: 'パスワード'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: 200,
                    height: 40,
                    child: TextField(
                      controller: passController2,
                      decoration: InputDecoration(hintText: '確認用パスワード'),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextField(
                    controller: facultyController,
                    decoration: InputDecoration(hintText: '所属学部'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: 200,
                    child: TextField(
                      controller: selfIntroductionController,
                      decoration: InputDecoration(hintText: 'プロフィール'),
                      keyboardType: TextInputType.multiline,
                      maxLength: 250,
                      maxLines: null,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(226, 212, 186, 100)),
                      onPressed: () {
                        if (nameController.text.isNotEmpty &&
                            passController2.text.isNotEmpty &&
                            selfIntroductionController.text.isNotEmpty &&
                            passController.text.isNotEmpty) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        '登録完了',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '▶既にアカウントをお持ちの方はこちら',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ))
              ],
            ),
          ),
        ));
  }
}
