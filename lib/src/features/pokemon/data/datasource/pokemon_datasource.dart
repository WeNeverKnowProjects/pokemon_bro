import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/exceptions/exceptions.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/request/fetch_request.dart';

abstract class PokemonDatasource {
  Future<List<Map<String, dynamic>>?> fetchPokemon(String url);
}

@LazySingleton(as: PokemonDatasource)
class PokemonDatasourceImpl implements PokemonDatasource {
  final FetchRequest request;
  PokemonDatasourceImpl(this.request);
  Future<String?> _fetchLocationAreaUrl(String url) async {
    try {
      final response = await request.fetch(url);
      if (response.statusCode != 200) {
        throw FetchException(response.reasonPhrase ?? "Something went wrong.");
      }
      var json = jsonDecode(response.body);
      return json['areas'][0]['url'];
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Map<String, dynamic>>?> fetchPokemon(String url) async {
    try {
      final areaUrl = await _fetchLocationAreaUrl(url);
      if (areaUrl == null) {
        throw UnknownException("Can't get area url");
      }
      Logger.d("area url $areaUrl");
      final response = await request.fetch(areaUrl);
      if (response.statusCode != 200) {
        throw FetchException(response.reasonPhrase ?? "Something went wrong.");
      }
      var json = jsonDecode(response.body);
      return (json['pokemon_encounters'] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw UnknownException("$e");
    }
  }
}
