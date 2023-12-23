import 'package:flutter/material.dart';
import 'package:pokdmon/src/features/skeleton/providers/select_page_provider.dart';
import 'package:pokdmon/src/features/skeleton/widgets/custom_bottom_icon_wigdge.dart';
import 'package:provider/provider.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int currentPage = Provider.of<SelectPageProvider>(context).currentPage;

    return BottomAppBar(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment:
                currentPage == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                width: constraints.maxWidth / 2,
                child: const Divider(
                  height: 0,
                  color: Colors.blueAccent,
                  thickness: 2,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomIconWigdge(
                isSelected: currentPage == 0,
                icon: Icons.search_outlined,
                onPressed: () {
                  Provider.of<SelectPageProvider>(context, listen: false)
                      .updatePage(0);
                  // print(currentPage);
                },
              ),
              CustomBottomIconWigdge(
                isSelected: currentPage == 1,
                icon: Icons.menu_outlined,
                onPressed: () {
                  Provider.of<SelectPageProvider>(context, listen: false)
                      .updatePage(1);
                  // print(currentPage);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
