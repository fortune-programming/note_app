import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fortune/utils/firestore/Authentication.dart';
import '../../model/account.dart';

class UserFirestore {
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users =
      _firestoreInstance.collection('users');
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<dynamic> setUser(Account newAccount) async {
    try {
      await users.doc(newAccount.id).set({
        'number': newAccount.number,
        'name': newAccount.name,
        'faculty': newAccount.faculty,
        'gread': newAccount.gread,
        //'image_path': newAccount.imagePath,
        //'profile': newAccount.profile,
        'created_time': Timestamp.now(),
        'updated_time': Timestamp.now(),
      });
      return true;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  static Future<dynamic> getUser(String uid) async {
    try {
      DocumentSnapshot documentSnapshot = await users.doc(uid).get();
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      Account myAccount = Account(
          id: uid,
          number: data['number'],
          name: data['name'],
          faculty: data['faculty'],
          gread: data['gread'],
          //imagePath: data['image_path'],
          //profile: data['profile'],
          createdTime: data['created_time'],
          updatedTime: data['updated_time']);
      Authentication.myAccount = myAccount;
      print('検索ユーザー取得完了');
      return true;
    } on FirebaseException catch (e) {
      print('ユーザー取得エラー: $e');
      return false;
    }
  }

  static Future<dynamic> getUserByNumber(String number) async {
    try {
      QuerySnapshot querySnapshot =
          await users.where('number', isEqualTo: number).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Account foundAccount = Account(
            id: documentSnapshot.id,
            number: data['number'],
            name: data['name'],
            faculty: data['faculty'],
            gread: data['gread'],
            //imagePath: data['image_path'],
            //profile:  data['profile'],
            createdTime: data['created_time'],
            updatedTime: data['updated_time']);
        Authentication.foundAccount = foundAccount;
        print('検索ユーザー取得完了');
        return true;
      } else {
        print('ユーザーが見つかりません');
        return false;
      }
    } on FirebaseException catch (e) {
      print('ユーザー取得エラー: $e');
      return false;
    }
  }

  static Future<dynamic> updateUser(Account updateAccount) async {
    try {
      await users.doc(updateAccount.id).update({
        'number': updateAccount.number,
        'name': updateAccount.name,
        'faculty': updateAccount.faculty,
        'gread': updateAccount.gread,
        //'image_path': updateAccount.imagePath,
        //'profile': updateAccount.profile,
        'updated_time': Timestamp.now()
      });
      print('ユーザー情報の更新完了');
      return true;
    } on FirebaseException catch (e) {
      print('ユーザー情報の更新エラー: $e');
      return false;
    }
  }

  UserSearchService get searchService => UserSearchService(_usersCollection);
}

class UserSearchService {
  final CollectionReference _usersCollection;

  UserSearchService(this._usersCollection);

  Future<List<Map<String, dynamic>>> searchUsersByNumber(
      String searchQuery) async {
    try {
      // Firestoreの検索クエリ
      QuerySnapshot querySnapshot = await _usersCollection
          .where('number', isGreaterThanOrEqualTo: searchQuery)
          .limit(5)
          .get();

      // 検索結果をリストに変換
      List<Map<String, dynamic>> searchResults = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      return searchResults;
    } catch (e) {
      print('Error searching users: $e');
      return [];
    }
  }
}
