import 'package:flutter/material.dart';

class CustomBottomIconWigdge extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final void Function() onPressed;
  const CustomBottomIconWigdge({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: IconButton(
        color: Colors.black,
        icon: isSelected
            ? Icon(
                icon,
                color: Colors.blue,
                size: 35,
              )
            : Icon(
                icon,
                color: Colors.black,
                size: 25,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
