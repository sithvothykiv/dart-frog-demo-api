import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  // Access the query parameters as a `Map<String, String>`.
  final queryParams = request.uri.queryParameters;

  // Get the value for the key `name`.
  // Default to `there` if there is no query parameter.
  final name = queryParams['name'] ?? 'there';

  final body = await request.body();
  return Response.json(body: {'data': 'This is a $name'});
}
