import 'package:pokdmon/src/features/pokemon/data/models/sprites_model.dart';
import 'package:pokdmon/src/features/pokemon/data/models/type_model.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.name,
    required super.id,
    required super.sprites,
    required super.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson["types"] as List;
    List<TypesModel> typesList =
        list.map((i) => TypesModel.fromJson(i)).toList();
    return PokemonModel(
      name: parsedJson["name"],
      id: parsedJson["id"],
      sprites: SpritesModel.fromJson(parsedJson["sprites"]),
      types: typesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "sprites": sprites,
      "types": types,
    };
  }
}



/* 

  final String name;
  final int id;
  final SpritesEntity sprites; => OtherEntity = > OfficialArtworkEntity  => frontDefault; frontShiny;
  final List<TypesEntity> types; => TypeEntity  => name;

*/