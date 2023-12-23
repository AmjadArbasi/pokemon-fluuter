import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:pokdmon/src/core/utils/errors/exceptions/cache_excpetion.dart';
import 'package:pokdmon/src/features/pokemon/data/models/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PokemonLocalDataSrc {
  Future<void>? cachePokemon(PokemonModel? pokemonModel);
  Future<PokemonModel> getLastPokemon();
}

const cachedPokemon = 'CACHED_POKEMON';

class PokemonLocalDataSrcImp implements PokemonLocalDataSrc {
  final SharedPreferences sharedPreferences;

  PokemonLocalDataSrcImp({required this.sharedPreferences});

  @override
  Future<void>? cachePokemon(PokemonModel? pokemonModel) async {
    if (pokemonModel != null) {
      sharedPreferences.setString(
          cachedPokemon, json.encode(pokemonModel.toJson()));
      Logger().i("");
    } else {
      throw CacheException();
    }
  }

  @override
  Future<PokemonModel> getLastPokemon() {
    final jsonString = sharedPreferences.getString(cachedPokemon);

    if (jsonString != null) {
      return Future.value(PokemonModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
