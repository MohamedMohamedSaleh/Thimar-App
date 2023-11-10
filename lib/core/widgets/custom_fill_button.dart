import 'package:flutter/material.dart';

class CustomFillButton extends StatelessWidget {
  const CustomFillButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        print(MediaQuery.of(context).size.height);
        FocusScope.of(context).unfocus();
      },
      child: Text(title),
    );
  }
}
