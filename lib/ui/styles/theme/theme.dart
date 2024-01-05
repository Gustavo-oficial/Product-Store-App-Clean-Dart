import 'package:flutter/material.dart';

ThemeData get theme => ThemeData(
  useMaterial3: true,
  colorScheme: _colorScheme,
  iconTheme: IconThemeData(color: _colorScheme.outline),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: _colorScheme.onBackground
    )
  )
);

ColorScheme get _colorScheme =>  ColorScheme(
  brightness: Brightness.light,
  primary: Colors.purple[400]!,
  onPrimary: Colors.white,
  secondary: Colors.amber[700]!,
  onSecondary: Colors.white,
  error: const Color.fromRGBO(162, 24, 14, 1),
  onError: Colors.white,
  background: const Color(0xFF26282B),
  onBackground: const Color(0xFF26282B),
  surface: const Color(0xFF74787D),
  onSurface: Colors.black,
  outline: const Color(0xFF26282B),
);
