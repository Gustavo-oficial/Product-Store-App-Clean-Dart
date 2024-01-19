import 'dart:async';

import 'package:fake_store_app/Interactor/base/screen_consts.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../Services/provider/product_provider.dart';
import 'image_hero.dart';


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
  final productProvider = GetIt.instance.get<ProductProvider>(); 
  
  @override
  void initState() {
    Timer.run(() {
      productProvider.getProduct(context: context, id: widget.id);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: ListenableBuilder(
              listenable: productProvider,
              builder: (_, __) {
                return productProvider.loadingState == ProductLoadingState.initial || productProvider.loadingState == ProductLoadingState.none ? const  CircularProgressIndicator() : Center(
                  child: Column(
                    children: [
                      Hero(
                        tag: "image", 
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (_) => ImageHero(id: widget.id)
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Image.network(
                              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
                              height: 120,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover
                            ),
                          ),
                        )
                      ),
                      Details(
                        tag: "Produto:", 
                        detail: productProvider.product.title ?? ""
                      ),
                      Details(
                        tag: "Descrição:", 
                        detail: productProvider.product.description ?? ""
                      ),
                      Details(
                        tag: "Preço:", 
                        detail: productProvider.product.price.toString()
                      )
                    ],
                  ),
                );
              }
            )
          )
        )
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key, 
    required this.tag, 
    this.detail
  });
  final String tag;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 56,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: colorScheme(context).surface
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                tag
              )
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                detail!,
                style: const TextStyle(
                  fontWeight: FontWeight.w700
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}