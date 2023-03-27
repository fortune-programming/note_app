import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fortune/model/note.dart';
import 'package:flutter_fortune/model/account.dart';
import 'package:flutter_fortune/model/note.dart';

class PostFirestore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference notes =
      _firestoreInstance.collection('notes');

  static Future<dynamic> addPost(Note newNote, Account account) async {
    try {
      final CollectionReference _userPosts = _firestoreInstance
          .collection('users')
          .doc(account.id)
          .collection('my_notes');
      var result = await notes.add({
        'title': newNote.title,
        'post_name': newNote.post_name,
        'good_number': newNote.good_number,
        'imageUrls': newNote.imageUrls,
        'field': newNote.field,
        'created_time': Timestamp.now()
      });
      _userPosts
          .doc(result.id)
          .set({'note_id': result.id, 'created_time': Timestamp.now()});
      print('投稿完了');
      return true;
    } on FirebaseException catch (e) {
      print('投稿エラー: $e');
    }
  }

  static Future<List<Note>?> getPostsFromIds(List<String> ids) async {
    List<Note> notelist = [];
    try {
      await Future.forEach(ids, (String id) async {
        var doc = await notes.doc(id).get();
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        Note note = Note(
          id: doc.id,
          title: data['title'],
          imageUrls: data['imageUrls'],
          post_name: data['post_name'],
          good_number: data['good_number'],
        );
        notelist.add(note);
      });
      print('自分の投稿取得');
      return notelist;
    } on FirebaseException catch (e) {
      print('自分の投稿取得エラー: $e');
      return null;
    }
  }

  static Future<dynamic> deletePosts(String accountId) async {
    final CollectionReference _userPosts = _firestoreInstance
        .collection('users')
        .doc(accountId)
        .collection('my_notes');
    var snapshot = await _userPosts.get();
    snapshot.docs.forEach((doc) async {
      await notes.doc(doc.id).delete();
      _userPosts.doc(doc.id).delete();
    });
  }
}
