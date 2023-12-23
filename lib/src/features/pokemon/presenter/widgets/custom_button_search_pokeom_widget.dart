import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokdmon/src/core/utils/connection/check_network.dart';
import 'package:pokdmon/src/features/pokemon/presenter/providers/pokemon_provider.dart';
import 'package:pokdmon/src/features/pokemon/presenter/providers/select_number_id_provider.dart';
import 'package:pokdmon/src/features/pokemon/presenter/widgets/custom_button_saearch_widget.dart';
import 'package:pokdmon/src/features/pokemon/presenter/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class CustomButtonPokeomWidget extends StatelessWidget {
  const CustomButtonPokeomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ScaffoldMessengerState scaffoldMessengerState =
        ScaffoldMessenger.of(context);
    SelectNumberIdProvider selectNumberIdProvider =
        Provider.of<SelectNumberIdProvider>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(
              value: "Random",
              onTap: () {
                int random = Random().nextInt(1008);
                selectNumberIdProvider.changeID(random);
                // print(random);
              },
            ),
            CustomButtonWidget(
              value: "#${selectNumberIdProvider.numberID}",
              onTap: () => showCupertinoModalPopup(
                context: context,
                builder: (context) => Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 200,
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: const Text(
                          "Done",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Expanded(
                        child: SafeArea(
                          top: false,
                          child: CupertinoPicker(
                            magnification: 1.3,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 33,
                            onSelectedItemChanged: (value) {
                              selectNumberIdProvider.changeID(value);
                              // print(value);
                            },
                            children: List<Widget>.generate(
                              1008,
                              (index) {
                                return Center(
                                  child: Text(
                                    "${index + 1}",
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        CustomButtonSaearchWidget(
          text: "Search",
          onTap: () async {
            Provider.of<PokemonProvider>(context, listen: false)
                .eitherFailureOrPokemon(
              value: (selectNumberIdProvider.numberID + 1).toString(),
            );
            // print(selectNumberIdProvider.numberID + 1);
            if (await NetworkInfoImp().isConnected == false) {
              scaffoldMessengerState.clearSnackBars();
              scaffoldMessengerState.showSnackBar(
                const SnackBar(
                  content: Text("No connection"),
                  showCloseIcon: true,
                  backgroundColor: Colors.blue,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
