import 'package:flutter/material.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({super.key, required this.title, required this.onPress});
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: FilledButton(
        onPressed: onPress,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
