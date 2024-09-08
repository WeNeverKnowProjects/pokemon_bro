import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/exceptions/exceptions.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/request/fetch_request.dart';

abstract class AreaDatasource {
  Future<List<Map<String, dynamic>>?> getAreas();
}

@LazySingleton(as: AreaDatasource)
class AreaDatasourceImpl implements AreaDatasource {
  final FetchRequest request;
  AreaDatasourceImpl(this.request);

  @override
  Future<List<Map<String, dynamic>>?> getAreas() async {
    try {
      final response = await request.fetchGql("area.q.gql",
          variables: Map.from({"limit": 3, "offset": 1}));
      final jsonBody = jsonDecode(response.body);
      Logger.d("jsonBody $jsonBody");
      try {
        return (jsonBody['data']['locations']['results'] as List)
            .map((e) => e as Map<String, dynamic>)
            .toList();
      } catch (e) {
        throw UnsupportedFormatException("JSON format error");
      }
    } catch (e) {
      throw FetchException("$e");
    }
    // return null;
  }
}
