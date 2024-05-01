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
  Account? myAccount = Authentication.myAccount;
  List<String> lists = [];

  void addList(String newList) {
    setState(() {
      lists.add(newList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFE2D4BA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'マイページ',
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
                                    (myAccount?.name == null)
                                        ? "アカウント名：未設定"
                                        : '${myAccount?.name}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text('@${myAccount?.number}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                                Text(
                                    (myAccount?.faculty == null)
                                        ? "学部：未設定"
                                        : '学部：${myAccount?.faculty!}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    (myAccount?.gread == null)
                                        ? "学年：未設定"
                                        : '学年：${myAccount?.gread!}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        OutlinedButton(
                            onPressed: () async {
                              var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mypage_edit()));
                              if (result == true) {
                                setState(() {
                                  myAccount = Authentication.myAccount!;
                                });
                              }
                            },
                            child: Text('編集')),
                        ListView.builder(
                          itemCount: lists.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(lists[index]),
                              onTap: () {
                                /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ListDetailPage(listName: lists[index]),
                                ),
                              );*/
                              },
                            );
                          },
                        ),
                      ])
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 新しいリストを追加
          addList('New List');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
