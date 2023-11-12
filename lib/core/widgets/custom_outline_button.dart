import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({super.key, required this.onPress});
final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 47,
        child: OutlinedButton(
        
          onPressed: onPress,
          child: Text(
            "إعادة الإرسال",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
