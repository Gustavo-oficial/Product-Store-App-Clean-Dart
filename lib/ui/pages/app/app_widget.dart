import 'package:fake_store_app/ui/pages/home/home_page.dart';
import 'package:fake_store_app/ui/styles/theme/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomePage(),
    );
  }
}