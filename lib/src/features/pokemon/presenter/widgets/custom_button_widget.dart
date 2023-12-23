import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String value;
  final void Function() onTap;

  const CustomButtonWidget({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20, right: 10),
        width: 120,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 241, 240, 241),
        ),
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
