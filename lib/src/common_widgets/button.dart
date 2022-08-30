import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function callback;
  final Color? color;
  final Color? textColor;
  final double width;

  const Button({
    Key? key,
    required this.label,
    required this.callback,
    this.color,
    this.textColor,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      width: width,
      child: TextButton(
        onPressed: () => callback(),
        style: TextButton.styleFrom(
          primary: Colors.black,
          backgroundColor: color ?? Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
