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
  UserFirestore _userFirestore = UserFirestore();

  List<Map<String, dynamic>> _searchResults = [];

  _searchUsers(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      List<Map<String, dynamic>> results =
          await _userFirestore.searchService.searchUsersByNumber(searchQuery);
      setState(() {
        // Firestoreから取得した結果をクライアントサイドでフィルタリング
        _searchResults = results
            .where((user) => user['number'].startsWith(searchQuery))
            .toList();
      });
    } else {
      setState(() {
        _searchResults.clear();
      });
    }
  }

  _onUserSearchSubmitted(String text) async {
    print("検索実行");
    var _result = await UserFirestore.getUserByNumber(text);
    if (_result == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Display()));
    } else {
      print("検索エラー");
    }
  }

  _onUserTapped(Map<String, dynamic> user) {
    // ユーザーがクリックされたときの処理を追加
    print('User tapped: $user');
    // ここで検索を実行する処理を呼び出す
    _onUserSearchSubmitted(user['number']);
  }

  void _submission(text) {
    setState(() {
  //    _controller.clear();
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
                    onChanged: (value) {
                      _searchUsers(value);
                    },
                    onSubmitted: (text) async {
                      _onUserSearchSubmitted(text);
                    }),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Expanded(
              child: _searchResults.isNotEmpty
                  ? ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> user = _searchResults[index];
                        return ListTile(
                          title: Text(user['name']),
                          subtitle: Text('@${user['number']}'),

                          onTap: () => _onUserTapped(user),
                          // 他のユーザー情報も表示できるように調整
                          // 例: subtitle: Text(user['number']),
                        );
                      },
                    )
                  : Center(
                      child: Text('アカウントが見つかりません'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
