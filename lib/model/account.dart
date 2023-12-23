import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id; //uid
  String name;
  String imagePath;
  String faculty;
  String gread;
  String profile;
  Timestamp? createdTime;
  Timestamp? updatedTime;
  Account(
      {this.id = '',
      this.name = '',
      this.imagePath = '',
      this.faculty = '',
      this.profile = '',
      this.gread = '',
      this.createdTime,
      this.updatedTime,
      });
}
