// storage/user_storage.dart
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../model/user.dart';

class UserStorage {
  final Map<String, User> _users = {};

  User? getUserByUsername(String username) {
    try {
      return _users.values.firstWhere(
        (user) => user.username == username,
      );
    } catch (e) {
      return null;
    }
  }

  User? getUserById(String id) {
    return _users[id];
  }

  User createUser(String username, String password) {
    final id = const Uuid().v4();
    final passwordHash = md5.convert(utf8.encode(password)).toString();
    final user = User(id: id, username: username, passwordHash: passwordHash);
    _users[id] = user;
    return user;
  }
}

final userStorage = UserStorage();
