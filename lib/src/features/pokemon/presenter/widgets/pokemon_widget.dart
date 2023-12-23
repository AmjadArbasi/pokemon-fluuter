import 'package:flutter/material.dart';
import 'package:pokdmon/src/core/utils/errors/failure.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokdmon/src/features/pokemon/presenter/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late Widget widget;
    PokemonEntity? pokemon = Provider.of<PokemonProvider>(context).pokemon;
    Failure? failure = Provider.of<PokemonProvider>(context).failure;

    if (pokemon != null) {
      widget = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
        width: double.infinity,
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: FittedBox(
                child: Text(
                  "# ${pokemon.id} ${pokemon.name.toUpperCase()}",
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 300,
              child: Image.network(
                pokemon.sprites.otherEntity.officialArtworkEntity.frontDefault,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: 120,
              height: 40,
              child: Text(
                pokemon.types[0].type.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    } else if (failure != null) {
      widget = Expanded(
        child: Center(
          child: Text(
            failure.errorMessage,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
    } else {
      widget = const Expanded(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      );
    }

    return widget;
  }
}
