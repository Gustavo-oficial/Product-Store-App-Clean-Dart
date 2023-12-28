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
        "/products",
        timeout: const Duration(seconds: 30),
        data: product.toNewProduct()
      ));

      return response.toSuccess();
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
          "/products",
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
}