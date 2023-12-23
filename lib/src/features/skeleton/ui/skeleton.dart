import 'package:flutter/material.dart';
import 'package:pokdmon/src/features/pokemon/presenter/ui/data_view.dart';
import 'package:pokdmon/src/features/pokemon/presenter/ui/pokemon_view.dart';
import 'package:pokdmon/src/features/skeleton/providers/select_page_provider.dart';
import 'package:pokdmon/src/features/skeleton/widgets/custom_bottom_bar_widget.dart';
import 'package:provider/provider.dart';

List<Widget> pages = [
  const Home(),
  const DataView(),
];

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    int currentpage = Provider.of<SelectPageProvider>(context).currentPage;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Pokemon",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
        elevation: 0,
      ),
      body: pages[currentpage],
      bottomNavigationBar: const CustomBottomBarWidget(),
    );
  }
}
