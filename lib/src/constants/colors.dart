import 'package:flutter/material.dart';

// Colors
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF000000);
const Color kBlack2 = Color(0xFF494949);
const Color kGray = Color(0xFFB5B5B5);
const Color kGray2 = Color(0xFF8A8A8A);
const Color kGray3 = Color(0xFFA9A9A9);
const Color kLightOrange = Color(0xFFF5F3EF);
const Color kGreen = Color(0xFF89C5A8);
const Color kGreen2 = Color(0xFFD2FFE9);

// Gradient
const homeBgGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(0, 0, 0, 0),
    Color.fromRGBO(0, 0, 0, 0.6),
    Color.fromRGBO(0, 0, 0, 1),
  ],
);

const edgeOvelayLeft = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color.fromRGBO(56, 56, 56, 1),
    // Color.fromRGBO(56, 56, 56, 0.6),
    Color.fromRGBO(56, 56, 56, 0),
  ],
);

const edgeOverlayRight = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Color.fromRGBO(56, 56, 56, 0),
    // Color.fromRGBO(56, 56, 56, 0.6),
    Color.fromRGBO(56, 56, 56, 1),
  ],
);

// Shadow
List<BoxShadow> customShadow2 = [
  const BoxShadow(
    color: Color.fromARGB(70, 201, 201, 201),
    blurRadius: 3.0, // soften the shadow
    spreadRadius: 1.0, //extend the shadow
    offset: Offset(
      -1, // Move to right horizontally
      0, // Move to bottom Vertically
    ),
  ),
  const BoxShadow(
    color: Color.fromARGB(30, 201, 201, 201),
    blurRadius: 20.0, // soften the shadow
    spreadRadius: 2.0, //extend the shadow
    offset: Offset(
      0.0, // Move to right horizontally
      4.0, // Move to bottom Vertically
    ),
  ),
];

List<BoxShadow> customShadow3 = [
  const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    spreadRadius: 0.0, //extend the shadow
    blurRadius: 5.0, // soften the shadow
    offset: Offset(
      0.0, // Move to right horizontally
      0.0, // Move to bottom Vertically
    ),
  ),
];

final appTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
);
