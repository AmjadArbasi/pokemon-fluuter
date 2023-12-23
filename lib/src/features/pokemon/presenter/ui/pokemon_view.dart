// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pokdmon/src/features/pokemon/presenter/widgets/custom_button_search_pokeom_widget.dart';
import 'package:pokdmon/src/features/pokemon/presenter/widgets/pokemon_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          PokemonWidget(),
          CustomButtonPokeomWidget(),
        ],
      ),
    );
  }
}
