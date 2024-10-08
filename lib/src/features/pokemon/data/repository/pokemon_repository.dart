import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/exceptions/exceptions.dart';
import 'package:pokemon/src/core/extension/string_extension.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/mapper/record_mapper.dart';
import 'package:pokemon/src/features/pokemon/data/datasource/pokemon_datasource.dart';

import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';

import '../../domain/repository/pokemon_repository.dart';

@LazySingleton(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDatasource datasource;
  PokemonRepositoryImpl(this.datasource);
  @override
  Future<(Failure?, List<Pokemon>?)> fetchPokemons(String url) async {
    try {
      final result = await datasource.fetchPokemon(url);
      var items = <Map<String, dynamic>>[];

      items = (result ?? []).map((e) {
        var item = e['pokemon'] as Map<String, dynamic>;
        var versionDetails = e['version_details'][0];
        var encounterDetails = versionDetails['encounter_details'][0];
        String? url = e['pokemon']['url'];
        // item.addAll({"id": int.tryParse((url)?.getLastUrlPath() ?? "")});
        Logger.d("url $url ${((url)?.getLastUrlPath() ?? "")}");
        item['id'] = int.tryParse((url)?.getLastUrlPath() ?? "");
        item['chance'] = encounterDetails['chance'];
        item['min_level'] = encounterDetails['min_level'];
        item['max_level'] = encounterDetails['max_level'];
        return item;
      }).toList();
      // for (var pokemon in result ?? []) {
      //   String? url = pokemon['pokemon']['url'];
      //   items.add({
      //     "name": pokemon['pokemon']['name'],
      //     "url": url,
      //     "id": int.tryParse((url)?.getLastUrlPath() ?? "")
      //   });
      // }
      return getItems<List<Pokemon>?>(
          items.map((e) => Pokemon.fromJson(e)).toList());
    } on FetchException catch (e) {
      return getError(FetchFailure(e.message));
    } on UnknownException catch (e) {
      return getError(FetchFailure(e.message));
    }
  }

  @override
  Future<(Failure?, void)> catchPokemon(
      String memberId, Pokemon pokemon) async {
    try {
      await datasource.catchPokemon(memberId, pokemon.toJson());
      return getItems<VoidCallback>(() {});
    } on FirestoreException catch (e) {
      // Logger.e("error ${e.message.toString()}");
      return getError(SubmitFailure(e.message));
    }
  }
}
