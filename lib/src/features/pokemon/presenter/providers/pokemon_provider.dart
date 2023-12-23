import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokdmon/src/core/utils/connection/check_network.dart';
import 'package:pokdmon/src/core/utils/errors/failure.dart';
import 'package:pokdmon/src/core/utils/param/pokemon_params.dart';
import 'package:pokdmon/src/features/pokemon/data/repo/pokemon_repo_imp.dart';
import 'package:pokdmon/src/features/pokemon/data/source/pokemon_local_data_src.dart';
import 'package:pokdmon/src/features/pokemon/data/source/pokemon_remote_data_src.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokdmon/src/features/pokemon/domain/usercases/retrieve_pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonProvider extends ChangeNotifier {
  PokemonEntity? pokemon;
  Failure? failure;

  PokemonProvider({this.pokemon, this.failure});

  void eitherFailureOrPokemon({required String value}) async {
    PokemonRepoImp pokemonRepoImp = PokemonRepoImp(
      pokemonRemoteDataSrc: PokemonRemoteDataSrcImp(
        dio: Dio(),
      ),
      pokemonLocalDataSrc: PokemonLocalDataSrcImp(
        sharedPreferences: await SharedPreferences.getInstance(),
      ),
      networkInfo: NetworkInfoImp(),
    );

    final failureOrPokemon =
        await RetrievePokemon(pokemonRepo: pokemonRepoImp).call(
      params: PokemonParams(id: value),
    );

    failureOrPokemon.fold(
      (newFailure) {
        pokemon = null;
        failure = newFailure;
        notifyListeners();
      },
      (newPokemon) {
        pokemon = newPokemon;
        failure = null;
        notifyListeners();
      },
    );
  }
}
