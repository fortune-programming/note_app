import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_fortune/model/note.dart';
import 'package:flutter_fortune/view/note/post_note_img.dart';

class postNotePage extends StatefulWidget {
  const postNotePage({super.key});

  @override
  State<postNotePage> createState() => _postNotePageState();
}

class _postNotePageState extends State<postNotePage> {
  String? title;
  var selectedValue = '薬理学';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 226, 212, 186),
          title: Text('ノート情報登録'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'ノートタイトル',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'ノートのタイトルを入力してください。';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    title = value!;
                  },
                ),
                SizedBox(height: 30),
                DropdownButton(
                  value: selectedValue,
                  items: [
                    DropdownMenuItem(child: Text('薬理学'), value: '薬理学'),
                    DropdownMenuItem(child: Text('微生物学'), value: '微生物学'),
                    DropdownMenuItem(child: Text('解剖学'), value: '解剖学'),
                  ],
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue as String;
                    });
                  },
                ),
                SizedBox(height: 80),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'ノート撮影画面は',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      TextSpan(
                        text: 'こちら',
                        style: TextStyle(color: Colors.lightBlue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              if (title != null && selectedValue != null) {
                                Note note = new Note(
                                  title: title!,
                                  field: selectedValue,
                                );

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            postNoteImgPage(note: note))));
                              }
                            }
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
