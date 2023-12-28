import 'package:result_dart/result_dart.dart';

import '../../Services/exception/failure_impl.dart';
import '../models/product_model.dart';

abstract class IProduct {
  AsyncResult<void, FailureImpl> newProduct({required Product product});

  AsyncResult<List<Product>, FailureImpl> getAllProducts();
}
