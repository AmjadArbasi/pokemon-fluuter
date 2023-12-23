import 'package:dartz/dartz.dart';
import 'package:pokdmon/src/core/utils/connection/check_network.dart';
import 'package:pokdmon/src/core/utils/errors/cache_failure.dart';
import 'package:pokdmon/src/core/utils/errors/exceptions/cache_excpetion.dart';
import 'package:pokdmon/src/core/utils/errors/exceptions/server_exception.dart';
import 'package:pokdmon/src/core/utils/errors/failure.dart';
import 'package:pokdmon/src/core/utils/errors/server_failure.dart';
import 'package:pokdmon/src/core/utils/param/pokemon_params.dart';
import 'package:pokdmon/src/features/pokemon/data/source/pokemon_local_data_src.dart';
import 'package:pokdmon/src/features/pokemon/data/source/pokemon_remote_data_src.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokdmon/src/features/pokemon/domain/repo/pokemon_repo.dart';

class PokemonRepoImp implements PokemonRepo {
  final PokemonRemoteDataSrc pokemonRemoteDataSrc;
  final PokemonLocalDataSrc pokemonLocalDataSrc;
  final NetworkInfo networkInfo;

  PokemonRepoImp({
    required this.pokemonRemoteDataSrc,
    required this.pokemonLocalDataSrc,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, PokemonEntity>> getPokemon(
      {required PokemonParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remotePokemon =
            await pokemonRemoteDataSrc.getPokemon(params: params);
        pokemonLocalDataSrc.cachePokemon(remotePokemon);
        return Right(remotePokemon);
      } on ServerException {
        return Left(ServerFailure(errorMessage: "Error from server!"));
      }
    } else {
      try {
        final localpokemon = await pokemonLocalDataSrc.getLastPokemon();
        return Right(localpokemon);
      } on CacheException {
        return Left(CacheFailure(errorMessage: "No local data found"));
      }
    }
  }
}
