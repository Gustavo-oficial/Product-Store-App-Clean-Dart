import 'package:flutter/material.dart';

import '../base/store.dart';
import '../interfaces/product_interface.dart';
import '../models/product_model.dart';

enum ProductLoadingState {
  none,
  initial,
  deleteLoading,
  createLoading,
  updateLoading,
  loaded,
  error
}

class ProductProvider extends Store {
  final IProduct repository;

  ProductProvider(this.repository);

  ProductLoadingState _loadingState = ProductLoadingState.none;
  ProductLoadingState get loadingState => _loadingState;

  List<Product> productList = List.empty(growable: true);
  Product product = Product.empty();

  setLoading({required ProductLoadingState value}) {
    _loadingState = value;

    notifyListeners();
  }

  Future<void>  getProducts() async{
    setLoading(value: ProductLoadingState.initial);

    var request = await repository.getAllProducts();

    request.fold(
      (success) {
        productList = success;

        setLoading(value: ProductLoadingState.loaded);
      }, 
      (failure) => null
    );

    notifyListeners();
  }

  Future<void>  getProduct({required BuildContext context, required String id}) async{
    setLoading(value: ProductLoadingState.initial);
    
    var request = await repository.getProductDetails(id: id);

    await request.fold(
      (success) async{
        product = success;

        setLoading(value: ProductLoadingState.loaded);
      }, 
      (failure) => showErrorMessage(context, failure.message)
    );

    notifyListeners();
  }

  Future<void> newProduct({required Product product}) async{
    setLoading(value: ProductLoadingState.createLoading);

    var request = await repository.newProduct(
      product: product
    );

    await request.fold(
      (success) async{
        await getProducts();
      }, 
      (failure) => null
    );

    notifyListeners();
  }

  Future<void> updateProduct({required Product product}) async{
    setLoading(value: ProductLoadingState.updateLoading);

    var request = await repository.updateProduct(
      product: product
    );

    await Future.delayed( const Duration(seconds: 2));

    await request.fold(
      (success) async{
        await getProducts();
      }, 
      (failure) => null
    );

    notifyListeners();
  }

  Future<void> deleteProduct({required String id}) async{
    setLoading(value: ProductLoadingState.deleteLoading);

    

    var request = await repository.deleteProduct(
      id: id
    );

    await Future.delayed( const Duration(seconds: 2));

    await request.fold(
      (success) async{
        await getProducts();
      }, 
      (failure) => null
    );

    notifyListeners();
  }
}