import 'package:flutter/material.dart';

class CustomListtilePaddWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? leading;

  const CustomListtilePaddWidget(
      {super.key, required this.title, this.subtitle, this.leading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle!),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
      ],
    );
  }
}
