import 'package:fake_store_app/Interactor/blocs/product_bloc/product_bloc.dart';
import 'package:fake_store_app/Interactor/interfaces/product_interface.dart';
import 'package:fake_store_app/Services/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'ui/pages/app/app_widget.dart';

void main() {
  DI.addInjections();

  runApp(const MyApp());
}

class DI {
  static void addInjections() async {
    final services = GetIt.instance;

    services.registerSingleton<IProduct>(ProductRepository());

    services.registerSingleton(ProductBloc(services.get<IProduct>()));
  }
}
