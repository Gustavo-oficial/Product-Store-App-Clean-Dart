import 'package:flutter/material.dart';

import '../../models/product_model.dart';

sealed class ProductEvent {
  
}

class NewProduct implements ProductEvent {
  final BuildContext context;
  final Product product;

  NewProduct({
    required this.context,
    required this.product
  });
}

class GetAllProduct implements ProductEvent {
  final BuildContext context;

  GetAllProduct({
    required this.context
  });
}