import 'package:pokdmon/src/features/pokemon/domain/entities/sprites_entity.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/types_entity.dart';

class PokemonEntity {
  final String name;
  final int id;
  final SpritesEntity sprites;
  final List<TypesEntity> types;

  PokemonEntity({
    required this.name,
    required this.id,
    required this.sprites,
    required this.types,
  });
}


/* 

  final String name;
  final int id;
  final SpritesEntity sprites; => OtherEntity = > OfficialArtworkEntity  => frontDefault; frontShiny;
  final List<TypesEntity> types; => TypeEntity  => name;

*/