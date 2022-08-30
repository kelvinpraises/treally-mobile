import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.textEditController,
    required this.textInputAction,
  }) : super(key: key);

  final String hintText;
  final TextEditingController textEditController;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditController,
      textInputAction: textInputAction,
      style: const TextStyle(
        fontSize: 25,
        color: kBlack2,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: kWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 19,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide.none,
          // borderSide: const BorderSide(
          //   color: kGreen,
          //   width: 2.0,
          // ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide.none,
          // borderSide: const BorderSide(
          //   color: kGreen,
          //   width: 2.0,
          // ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 25,
          color: kGray3,
        ),
      ),
    );
  }
}
