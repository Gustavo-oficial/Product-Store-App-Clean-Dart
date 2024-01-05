import 'package:fake_store_app/Interactor/base/screen_consts.dart';
import 'package:fake_store_app/Interactor/models/product_model.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
    required this.product,
    this.delete,
    this.update,
    this.disable = false,
  });
  final Product product;
  final VoidCallback? delete;
  final VoidCallback? update;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
        color: disable? colorScheme(context).secondary : colorScheme(context).surface,
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              product.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              product.price.toString()
            ),
          ),
          Expanded(
            flex: 0,
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: update,
              child: const Icon(
                Icons.change_circle_outlined
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: InkWell(
              splashFactory: NoSplash.splashFactory,
              onTap: disable? null : delete,
              child: const Icon(
                Icons.delete
              ),
            ),
          )
        ],
      ),
    );
  }
}