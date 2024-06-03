// routes/login.dart
import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dart_frog/dart_frog.dart';

import '../storage/storage.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405, body: 'Method Not Allowed');
  }

  final data = jsonDecode(await context.request.body()) as Map<String, dynamic>;
  final username = data['username'] as String;
  final password = data['password'] as String;

  final user = userStorage.getUserByUsername(username);
  if (user == null) {
    return Response(statusCode: 401, body: 'Invalid username or password');
  }

  final passwordHash = md5.convert(utf8.encode(password)).toString();
  if (user.passwordHash != passwordHash) {
    return Response(statusCode: 401, body: 'Invalid username or password');
  }

  // For simplicity, we'll just return the user info. In a real-world app, you'd generate a session or token.
  return Response.json(body: user.toJson());
}
