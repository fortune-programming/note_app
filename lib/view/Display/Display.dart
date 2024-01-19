import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_fortune/model/account.dart';
import 'package:flutter_fortune/utils/firestore/Authentication.dart';
import 'package:flutter_fortune/view/Mypage_edit/Mypage_edit.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  Account? foundAccount = Authentication.foundAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFE2D4BA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          '検索結果',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    (foundAccount?.name == null)
                                        ? "アカウント名：未設定"
                                        : '${foundAccount?.name}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text('@${foundAccount?.number}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                                Text(
                                    (foundAccount?.faculty == null)
                                        ? "学部：未設定"
                                        : '学部：${foundAccount?.faculty!}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    (foundAccount?.gread == null)
                                        ? "学年：未設定"
                                        : '学年：${foundAccount?.gread!}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
