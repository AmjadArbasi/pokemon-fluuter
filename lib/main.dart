import 'package:flutter/material.dart';
import 'package:pokdmon/src/features/pokemon/presenter/providers/pokemon_provider.dart';
import 'package:pokdmon/src/features/pokemon/presenter/providers/select_number_id_provider.dart';
import 'package:pokdmon/src/features/skeleton/providers/select_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:pokdmon/src/features/skeleton/ui/skeleton.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PokemonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectNumberIdProvider(),
        )
      ],
      child: const FirstStep(),
    ),
  );
}

class FirstStep extends StatefulWidget {
  const FirstStep({super.key});

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep> {
  @override
  void initState() {
    SelectNumberIdProvider selectNumberIdProvider =
        Provider.of<SelectNumberIdProvider>(context, listen: false);
    PokemonProvider pokemonProvider =
        Provider.of<PokemonProvider>(context, listen: false);

    pokemonProvider.eitherFailureOrPokemon(
      value: (selectNumberIdProvider.numberID + 1).toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Skeleton(),
    );
  }
}
