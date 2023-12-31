import 'package:result_dart/result_dart.dart';

import '../../Services/exception/failure_impl.dart';
import '../models/product_model.dart';

abstract class IProduct {
  AsyncResult<void, FailureImpl> newProduct({required Product product});

  AsyncResult<void, FailureImpl> updateProduct({required Product product});
  
  AsyncResult<void, FailureImpl> deleteProduct({required String id});

  AsyncResult<Product, FailureImpl> getProductDetails({required String id});

  AsyncResult<List<Product>, FailureImpl> getAllProducts();
}