import 'package:fake_store_app/ui/styles/theme/theme.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: Routes.router,
    );
  }
}