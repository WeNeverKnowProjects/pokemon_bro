import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/graphql/parser.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/src/core/log/logger.dart';

@singleton
class FetchRequest {
  final GqlParser parser;
  FetchRequest(this.parser);

  Future<http.Response> fetch(String url) async {
    final response = await http.get(Uri.parse(url),
        headers: Map.from({
          "Content-Type": "application/json",
        }));
    return response;
  }

  Future<http.Response> fetchGql(
    String filename, {
    Map<String, dynamic>? variables,
  }) async {
    var body = await parser.gqlRequestBody(filename, variables ?? {});
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: Map.from(
        {
          'Content-Type': 'application/json; charset=utf-8',
          'X-Apollo-Operation-Name': 'post',
          'Apollo-Require-Preflight': 'true',
        },
      ),
      body: body,
    );
    Logger.d("url ${response.request?.url.host} ");

    return response;
  }
}
