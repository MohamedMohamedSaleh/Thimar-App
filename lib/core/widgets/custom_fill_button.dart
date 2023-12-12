import 'package:flutter/material.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.isLoading = false});
  final String title;
  final VoidCallback onPress;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
