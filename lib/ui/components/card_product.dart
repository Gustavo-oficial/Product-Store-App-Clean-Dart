import 'package:fake_store_app/Interactor/models/product_model.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.product
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              product.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 0,
            child: Text(
              product.price!.toString()
            ),
          )
        ],
      ),
    );
  }
}