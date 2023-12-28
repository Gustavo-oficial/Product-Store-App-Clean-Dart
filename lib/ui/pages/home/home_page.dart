import 'package:fake_store_app/Interactor/blocs/product_bloc/product_bloc.dart';
import 'package:fake_store_app/Interactor/blocs/product_bloc/product_event.dart';
import 'package:fake_store_app/Interactor/blocs/product_bloc/product_state.dart';
import 'package:fake_store_app/ui/components/card_product.dart';
import 'package:fake_store_app/ui/components/loading.dart';
// import 'package:fake_store_app/Interactor/models/product_model.dart';
// import 'package:fake_store_app/ui/components/action_button.dart';
// import 'package:fake_store_app/ui/components/input_component.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../ui/pages/error_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _title = TextEditingController();
  // final TextEditingController _price = TextEditingController();
  // final TextEditingController _description= TextEditingController();
  // final TextEditingController _category = TextEditingController();
  final productBLoC = GetIt.instance.get<ProductBloc>(); 

  @override
  void initState() {
    productBLoC.input.add(GetAllProduct(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: productBLoC.output, 
                builder: (_, state){
                  return switch(state.data){
                    ProductLoadingState() => loadingProducts(),
                    ProductLoadedState() => ListView.separated(
                      separatorBuilder: (_, __) {
                        return const SizedBox(height: 8);
                      },
                      primary: false,
                      shrinkWrap: true,
                      itemCount: productBLoC.products.length,
                      itemBuilder: (_, index){
                        return CardProduct(
                          product: productBLoC.products[index]
                        );
                      }
                    ),
                    ProductErrorState() => const ErrorPage(),
                    _ => const ErrorPage()
                  };
                }
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.purple,
              )
            ],
          )
          // Column(
          //   children: [
          //     Input(
          //       controller: _title,
          //       label: "Título"
          //     ), 
          //     const SizedBox(height: 8),
          //     Input(
          //       controller: _title,
          //       label: "Preço",
          //       keyboardType: TextInputType.number
          //     ),
          //     const SizedBox(height: 8),
          //     Input(
          //       controller: _title,
          //       label: "Descriçäo"
          //     ),
          //     const SizedBox(height: 8),
          //     Input(
          //       controller: _title,
          //       label: "Image"
          //     ),
          //     const SizedBox(height: 8),
          //     Input(
          //       controller: _title,
          //       label: "Categoria"
          //     ),
          //     const SizedBox(height: 24),
          //     ActionButton(
          //       text: "Criar novo produto",
          //       action: () {
          //         Product product = Product.fromJson({
          //           "title": _title.text,
          //           "price": _price.text,
          //           "description": _description.text,
          //           "image": "",
          //           "category": _category.text
          //         });
          
          //         productBLoC.input.add(
          //           NewProduct(
          //             context: context, 
          //             product: product
          //           )
          //         );
          //       }
          //     )
          //   ],
          // ),
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
          return Loading(
            height: 56,
            width: MediaQuery.of(context).size.width
          );
        }
      ),
    );
  }
}