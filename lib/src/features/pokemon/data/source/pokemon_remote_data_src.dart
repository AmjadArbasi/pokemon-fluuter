import 'package:dio/dio.dart';
import 'package:pokdmon/src/core/utils/errors/exceptions/server_exception.dart';
import 'package:pokdmon/src/core/utils/param/pokemon_params.dart';
import 'package:pokdmon/src/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSrc {
  Future<PokemonModel> getPokemon({required PokemonParams params});
}

class PokemonRemoteDataSrcImp implements PokemonRemoteDataSrc {
  final Dio dio;

  PokemonRemoteDataSrcImp({required this.dio});

  @override
  Future<PokemonModel> getPokemon({required PokemonParams params}) async {
    try {
      // 404
      final response =
          await dio.get("https://pokeapi.co/api/v2/pokemon/${params.id}");
      return PokemonModel.fromJson(response.data);
    } on DioException catch (_) {
      throw ServerException();
    }
  }
}
