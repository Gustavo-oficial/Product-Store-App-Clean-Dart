import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Interactor/provider/product_provider.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.id
  });
  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var productProvider = context.read<ProductProvider>();
    productProvider.getProduct(context: context, id: widget.id);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: ListenableBuilder(
              listenable: productProvider,
              builder: (_, __) {
                return productProvider.loadingState == ProductLoadingState.initial || productProvider.loadingState == ProductLoadingState.none ? const  CircularProgressIndicator() : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(productProvider.product.title ?? ""),
                    Text(productProvider.product.description ?? ""),
                    Text(productProvider.product.price.toString()),
                  ],
                );
              }
            )
          )
        )
      ),
    );
  }
}