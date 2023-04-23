import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('タブ画面移動サンプル'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined)  
                  ),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ]),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(child: Text('くもり', style: TextStyle(fontSize: 50))),
              Center(child: Text('雨', style: TextStyle(fontSize: 50))),
              Center(child: Text('晴れ', style: TextStyle(fontSize: 50))),
            ],
          ),
        ),
      ),
    );
  }
}
