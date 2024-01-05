// ignore_for_file: unused_local_variable

import 'package:fake_store_app/Services/config/api_config.dart';
import 'package:fake_store_app/Services/exception/failure_impl.dart';
import 'package:fake_store_app/Services/exception/request_exception.dart';
import 'package:result_dart/result_dart.dart';
import 'package:uno/uno.dart';

import '../../Interactor/interfaces/product_interface.dart';
import '../../Interactor/models/product_model.dart';

class ProductRepository implements IProduct {
  @override
  AsyncResult<void, FailureImpl> newProduct({required Product product}) async{
    try {
      Future<Response> response = await APIConfig.request().then((uno) => uno.post(
        "/Products",
        timeout: const Duration(seconds: 30),
        data: product.toJson()
      ));

      return toSuccess();
    } on UnoError catch (error) {
      return Failure(FailureImpl(message: RequestException.getError(data: error.response?.data, defaultMessage: "Erro ao cadastrar novo produto..."), data: error));
    } catch (exception) {
      return Failure(FailureImpl(message: RequestException.getError(defaultMessage: "Erro ao cadastrar novo produto...")));
    }
  }
  
  @override
  AsyncResult<List<Product>, FailureImpl> getAllProducts() async{
    try {
      Response response = await APIConfig.request().then(
        (uno) => uno.get(
          "/Products",
          timeout: const Duration(seconds: 30)
        )
      );
    
      return (response.data as List).map((e) => Product.fromJson(e)).toList().toSuccess();
    } on UnoError catch (error) {
      return Failure(FailureImpl(message: RequestException.getError(data: error.response?.data, defaultMessage: "Erro ao buscar produtos..."), data: error));
    } catch (exception) {
      return Failure(FailureImpl(message: RequestException.getError(defaultMessage: "Erro ao buscar produtos...")));
    }
  }

  @override
  AsyncResult<void, FailureImpl> updateProduct({required Product product}) async {
    try {
      Future<Response> response = await APIConfig.request().then((uno) => uno.put(
        "/Products/${product.id}",
        timeout: const Duration(seconds: 30),
        data: product.toJson()
      ));

      return toSuccess();
    } on UnoError catch (error) {
      return Failure(FailureImpl(message: RequestException.getError(data: error.response?.data, defaultMessage: "Erro ao alterar produto..."), data: error));
    } catch (exception) {
      return Failure(FailureImpl(message: RequestException.getError(defaultMessage: "Erro ao alterar produto...")));
    }
  }
  
  @override
  AsyncResult<void, FailureImpl> deleteProduct({required String id}) async {
    try {
      Future<Response> response = await APIConfig.request().then((uno) => uno.delete(
        "/Products/$id",
        timeout: const Duration(seconds: 30),
      ));

      return toSuccess();
    } on UnoError catch (error) {
      return Failure(FailureImpl(message: RequestException.getError(data: error.response?.data, defaultMessage: "Erro ao excluir produto..."), data: error));
    } catch (exception) {
      return Failure(FailureImpl(message: RequestException.getError(defaultMessage: "Erro ao excluir produto...")));
    }
  }
}