import 'dart:convert';
import 'dart:math';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/exceptions/exceptions.dart';
import 'package:pokemon/src/core/firebase/firestore/firestore_service.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/request/fetch_request.dart';

final _random = Random();

abstract class PokemonDatasource {
  Future<List<Map<String, dynamic>>?> fetchPokemon(String url);
  Future<void> catchPokemon(String uid, Map<String, dynamic> body);
}

@LazySingleton(as: PokemonDatasource)
class PokemonDatasourceImpl implements PokemonDatasource {
  final FetchRequest request;
  final FirestoreService firestore;
  PokemonDatasourceImpl(this.request, this.firestore);
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

  Future<void> _updateNumberMember(String uid) async {
    final collection = await firestore.getDocument<Map<String, dynamic>>(
        collectionPath: "/member", id: uid, builder: (data, docsId) => data);
    if (collection != null) {
      //increment `numbers` by 1
      var numbers = collection['numbers'];
      collection['numbers'] = numbers + 1;

      await firestore.setData(path: "/member/$uid", body: collection);
    }
  }

  @override
  Future<void> catchPokemon(String uid, Map<String, dynamic> body) async {
    try {
      final pokemonCollection =
          await firestore.getCollection<Map<String, dynamic>>(
        path: "/member/$uid/pokemon",
        builder: (data, id) => data
          ..addAll(
            {"docId": id},
          ),
        queryBuilder: (query) {
          return query.where("name", isEqualTo: body['name']);
        },
      );
      if (pokemonCollection.isEmpty) {
        //random number for level, between 1 & `max_level`
        var minLevel = 1;
        var maxLevel = body['max_level'] as int;
        int level = minLevel + _random.nextInt(maxLevel - minLevel);
        body['level'] = level;

        var docsId = "${DateTime.now().microsecondsSinceEpoch}";

        await firestore.setData(
            path: "/member/$uid/pokemon/$docsId", body: body);
        _updateNumberMember(uid);
      } else {
        //existing pokemon in pokeball (firestore)
        var existingPokemon = pokemonCollection.last;
        var maxLevel = existingPokemon['max_level'] as int;
        var level = existingPokemon['level'] as int;
        var name = existingPokemon['name'];

        if (level == maxLevel) {
          throw FirestoreException(
              "Pokemon $name level reach out the maximal level.");
        }

        //if pokemon exist in pokeball, level increment by 1
        body['level'] = (existingPokemon['level'] as int) + 1;
        var docsId = "${DateTime.now().microsecondsSinceEpoch}";

        await firestore.setData(
            path: "/member/$uid/pokemon/$docsId", body: body);
        await _updateNumberMember(uid);
      }
    } catch (e) {
      throw FirestoreException("$e");
    }
  }
}
