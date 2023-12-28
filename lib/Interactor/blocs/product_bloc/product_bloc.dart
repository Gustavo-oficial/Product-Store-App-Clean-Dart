import 'dart:async';
import 'package:result_dart/result_dart.dart';

import '../../interfaces/product_interface.dart';
import '../../models/product_model.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc {
  List<Product> products = List.empty(growable: true);

  final IProduct repository;

  final StreamController<ProductEvent> _inputController = StreamController<ProductEvent>();

  final StreamController<ProductState> _outputController = StreamController<ProductState>();

  Sink<ProductEvent> get input => _inputController.sink;

  Stream<ProductState> get output => _outputController.stream;

  ProductBloc(this.repository){
    _inputController.stream.listen(_mapEventToState);
  }

  void _mapEventToState (ProductEvent event) async{
    try {
      _outputController.add(ProductLoadingState());

      dynamic data;

      data = switch(event) {
        NewProduct() => await repository.newProduct(
          product:  event.product
        ).then(
          (response) => response.fold(
            (success) => null, 
            (failure) => null
          )
        ),
        GetAllProduct() => await repository.getAllProducts().fold(
          (success) => products = success, 
          (error) => null
        )
      };

      _outputController.add(ProductLoadedState(data: data));
    } on Exception catch(e) {
      _outputController.add(ProductErrorState(exception: e));
    }
  }
}