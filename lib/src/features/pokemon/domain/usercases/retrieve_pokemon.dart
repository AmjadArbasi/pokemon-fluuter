import 'package:dartz/dartz.dart';
import 'package:pokdmon/src/core/utils/errors/failure.dart';
import 'package:pokdmon/src/core/utils/param/pokemon_params.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokdmon/src/features/pokemon/domain/repo/pokemon_repo.dart';

class RetrievePokemon {
  final PokemonRepo pokemonRepo;

  RetrievePokemon({required this.pokemonRepo});

  Future<Either<Failure, PokemonEntity>> call(
      {required PokemonParams params}) async {
    return await pokemonRepo.getPokemon(params: params);
  }
}
