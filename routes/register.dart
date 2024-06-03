// routes/register.dart
import 'dart:async';
import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';

import '../storage/storage.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(statusCode: 405, body: 'Method Not Allowed');
  }

  final data = jsonDecode(await context.request.body()) as Map<String, dynamic>;
  final username = data['username'] as String;
  final password = data['password'] as String;

  final existingUser = userStorage.getUserByUsername(username);
  if (existingUser != null) {
    return Response(statusCode: 409, body: 'User already exists');
  }

  final user = userStorage.createUser(username, password);
  return Response.json(body: user.toJson());
}
