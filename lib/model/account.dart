import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String id; //uid
  String number;
  String name;
  String faculty;
  String gread;
  //String imagePath;
  //String profile;
  Timestamp? createdTime;
  Timestamp? updatedTime;
  Account({
    this.id = '',
    this.number = '',
    this.name = '',
    this.faculty = '',
    this.gread = '',
    //this.imagePath = '',
    //this.profile = '',
    this.createdTime,
    this.updatedTime,
  });
}
