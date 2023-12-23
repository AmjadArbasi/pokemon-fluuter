class SpritesEntity {
  final OtherEntity otherEntity;
  SpritesEntity({required this.otherEntity});
}

class OtherEntity {
  final OfficialArtworkEntity officialArtworkEntity;
  OtherEntity({required this.officialArtworkEntity});
}

class OfficialArtworkEntity {
  final String frontDefault;
  final String frontShiny;

  OfficialArtworkEntity({required this.frontDefault, required this.frontShiny});
}


// final SpritesEntity sprites; => OtherEntity = > OfficialArtworkEntity  => frontDefault; frontShiny;