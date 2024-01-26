import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune/utils/firestore/users.dart';
import '../Display/Display.dart';

class Search extends StatefulWidget implements PreferredSizeWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();

  final _controller = TextEditingController();

  void _submission(text) {
    setState(() {
      _controller.clear();
      if (kDebugMode) {
        print(text);
      }
    });
  }

  void _getUserByNumber(text) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFE2D4BA),
        title: SizedBox(
          height: 43,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Container(
                width: 440,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '検索',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.clear),
                      contentPadding: EdgeInsets.only(left: 8.0),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                    ),
                    onSubmitted: (text) async {
                      print("検索実行");
                      var _result = await UserFirestore.getUserByNumber(text);
                      if (_result == true) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Display()));
                      } else {
                        print("検索エラー");
                      }
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
