import 'package:pokdmon/src/features/pokemon/domain/entities/sprites_entity.dart';

class SpritesModel extends SpritesEntity {
  SpritesModel({required super.otherEntity});

  factory SpritesModel.fromJson(Map<String, dynamic> parsedJson) {
    return SpritesModel(
      otherEntity: OtherModel.fromJson(parsedJson["other"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "other": otherEntity,
    };
  }
}

class OtherModel extends OtherEntity {
  OtherModel({required super.officialArtworkEntity});
  factory OtherModel.fromJson(Map<String, dynamic> parsedJson) {
    return OtherModel(
      officialArtworkEntity:
          OfficialArtworkModel.fromJson(parsedJson["official-artwork"]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "official-artwork": officialArtworkEntity,
    };
  }
}

class OfficialArtworkModel extends OfficialArtworkEntity {
  OfficialArtworkModel(
      {required super.frontDefault, required super.frontShiny});

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> parsedJson) {
    return OfficialArtworkModel(
      frontDefault: parsedJson["front_default"],
      frontShiny: parsedJson["front_shiny"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "front_default": frontDefault,
      "front_shiny": frontShiny,
    };
  }
}
  // final SpritesEntity sprites; => OtherEntity = > OfficialArtworkEntity  => frontDefault; frontShiny;
