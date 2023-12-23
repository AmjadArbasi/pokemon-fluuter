import 'package:dartz/dartz.dart';
import 'package:pokdmon/src/core/utils/errors/failure.dart';
import 'package:pokdmon/src/core/utils/param/pokemon_params.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonRepo {
  Future<Either<Failure, PokemonEntity>> getPokemon(
      {required PokemonParams params});
}
