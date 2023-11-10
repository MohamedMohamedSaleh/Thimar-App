import 'package:flutter/material.dart';

class CustomAppInput extends StatefulWidget {
  const CustomAppInput({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.paddingBottom = 16,
    this.isPhone = false,
    this.isPassword = false,
  });
  final String labelText;
  final String prefixIcon;
  final double paddingBottom;
  final bool isPhone;
  final bool isPassword;

  @override
  State<CustomAppInput> createState() => _CustomAppInputState();
}

class _CustomAppInputState extends State<CustomAppInput> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.paddingBottom,
      ),
      child: TextFormField(
        keyboardType: widget.isPhone
            ? TextInputType.number
            : TextInputType.text,
        obscureText: isSecure && widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12
            ),
            child: Image.asset(
              widget.prefixIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                  icon:
                      Icon(isSecure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          icon: widget.isPhone
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffF3F3F3),
                    ),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    // color: Colors.red,
                  ),
                  width: 60,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/saudia_flag.png"),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "+966",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
