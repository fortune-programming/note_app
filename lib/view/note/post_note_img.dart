import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fortune/view/screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/note.dart';

class postNoteImgPage extends StatefulWidget {
  final Note note;

  // コンストラクタ
  const postNoteImgPage({Key? key, required this.note}) : super(key: key);

  @override
  State<postNoteImgPage> createState() => _postNoteImgPageState();
}

class _postNoteImgPageState extends State<postNoteImgPage> {
  File? _imageFile;
  List<File> _imageFiles = [];
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ノート撮影画面'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 226, 212, 186),
      ),
      body: Column(
        children: [
          Expanded(
            child: _imageFiles == null
                ? Center(child: Text('No image selected.'))
                : ListView.builder(
                    itemCount: _imageFiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: 80, child: Image.file(_imageFiles[index]));
                    },
                  ),
          ),
          ElevatedButton(onPressed: () {
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Screen()),
             );
          }, child: Text('アップロードする'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () async {
          final pickedFile = await picker.pickImage(source: ImageSource.camera);
          if (pickedFile != null) {
            setState(() {
              _imageFile = File(pickedFile.path);
            });
            _imageFiles.add(_imageFile!);
          }
        },
      ),
    );
  }
}
