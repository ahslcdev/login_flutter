
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserModel {
  final int? id;
  final String username;
  final String password;

  const UserModel({
    this.id,
    required this.username,
    required this.password,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  // @override
  // String toString() {
  //   return 'Dog{id: $id, username: $username}';
  // }
}