// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pokdmon/src/features/pokemon/presenter/widgets/data_widget.dart';

class DataView extends StatelessWidget {
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataWidget(),
    );
  }
}
