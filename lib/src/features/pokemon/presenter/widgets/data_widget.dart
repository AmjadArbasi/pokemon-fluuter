import 'package:flutter/material.dart';
import 'package:pokdmon/src/core/utils/errors/failure.dart';
import 'package:pokdmon/src/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokdmon/src/features/pokemon/presenter/providers/pokemon_provider.dart';
import 'package:pokdmon/src/features/pokemon/presenter/widgets/custom_listtile_padd_widget.dart';
import 'package:provider/provider.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late Widget widget;
    PokemonEntity? pokemon = Provider.of<PokemonProvider>(context).pokemon;
    Failure? failure = Provider.of<PokemonProvider>(context).failure;

    if (pokemon != null) {
      widget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "API",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "https://pokeapi.co/api/v2/pokemon/${pokemon.id}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          CustomListtilePaddWidget(
            title: 'name',
            subtitle: pokemon.name,
          ),
          CustomListtilePaddWidget(
            title: 'id',
            subtitle: '${pokemon.id}',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20, top: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Text("${pokemon.sprites}"),
                  title: const Text("sprites"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text("${pokemon.sprites.otherEntity}"),
                        title: const Text("other"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Text(
                                  "${pokemon.sprites.otherEntity.officialArtworkEntity}"),
                              title: const Text("official-artwork"),
                            ),
                            ListTile(
                              title: const Text("front_default"),
                              subtitle: SelectableText(pokemon
                                  .sprites
                                  .otherEntity
                                  .officialArtworkEntity
                                  .frontDefault),
                            ),
                            ListTile(
                              title: const Text("front_shiny"),
                              subtitle: SelectableText(
                                pokemon.sprites.otherEntity
                                    .officialArtworkEntity.frontShiny,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                ListTile(
                  leading: Text("${pokemon.types}"),
                  title: const Text("types"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text("${pokemon.types[0].type}"),
                        title: const Text("type"),
                      ),
                      ListTile(
                        title: const Text("name"),
                        subtitle: Text(pokemon.types[0].type.name),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
