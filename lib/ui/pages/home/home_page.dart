import 'package:fake_store_app/Interactor/base/screen_consts.dart';
import 'package:fake_store_app/Interactor/models/product_model.dart';
import 'package:fake_store_app/Services/provider/product_provider.dart';
import 'package:fake_store_app/ui/components/card_product.dart';
import 'package:fake_store_app/ui/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productProvider = GetIt.instance.get<ProductProvider>(); 

  @override
  void initState() {
    productProvider.getProducts();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateProduct({required Product product}) {
    Product updated = product.copyWith(
      price: product.price!+1
    );
    
    productProvider.updateProduct(product: updated);
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
              builder: (_, child) {
                return Column(
                  children: [
                    const SizedBox(height: 8),
                    FloatingActionButton(
                      onPressed: productProvider.loadingState == ProductLoadingState.initial ? null : () => productProvider.newProduct(product: Product(
                        title: "Product",
                        price: 5.99,
                        description: "Nova descricao",
                        image: "",
                        category: "refri"
                      )),
                      backgroundColor: colorScheme(context).primary,
                      child: productProvider.loadingState == ProductLoadingState.createLoading ? const CircularProgressIndicator(
                        color: Colors.white
                      ) : const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24
                      ),
                    ),
                    const SizedBox(height: 16),
                    productProvider.loadingState == ProductLoadingState.initial ? loadingProducts() : ListView.separated(
                      separatorBuilder: (__, ___) {
                        return const SizedBox(height: 8);
                      },
                      primary: false,
                      shrinkWrap: true,
                      itemCount: productProvider.productList.length,
                      itemBuilder: (_, index){
                        return CardProduct(
                          product: productProvider.productList[index],
                          delete: () => productProvider.deleteProduct(id: productProvider.productList[index].id!),
                          update: () => updateProduct(product: productProvider.productList[index]),
                          disable: productProvider.loadingState == ProductLoadingState.deleteLoading || productProvider.loadingState == ProductLoadingState.updateLoading
                        );
                      }
                    ),
                  ],
                );
              },
            )
          ),
        ),
      ),
    );
  }
  
  Widget loadingProducts(){
    return SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (_, __) {
          return const SizedBox(height: 8);
        },
        primary: false,
        shrinkWrap: true,
        itemCount: 17,
        itemBuilder: (_, index){
          return Skelton(
            height: 56,
            width: MediaQuery.of(context).size.width
          );
        }
      ),
    );
  }
}