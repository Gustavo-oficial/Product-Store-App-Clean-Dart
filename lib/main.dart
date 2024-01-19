import 'package:fake_store_app/Interactor/interfaces/product_interface.dart';
import 'package:fake_store_app/Services/provider/product_provider.dart';
import 'package:fake_store_app/Services/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'ui/pages/app/app_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  DI.addInjections();
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(ProductRepository()),
      child: const MyApp()
    ),
  );
}

class DI {
  static void addInjections() async {
    final services = GetIt.instance;

    services.registerSingleton<IProduct>(ProductRepository());

    services.registerSingleton(ProductProvider(services.get<IProduct>()));
  }
}
