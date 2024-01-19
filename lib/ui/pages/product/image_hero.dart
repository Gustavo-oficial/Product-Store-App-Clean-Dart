import 'package:fake_store_app/ui/pages/product/product_page.dart';
import 'package:flutter/material.dart';

class ImageHero extends StatelessWidget {
  const ImageHero({
    super.key,
    required this.id
  });
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: "image", 
        child: GestureDetector(
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (_) => ProductPage(id: id)
            )
          ),
          child: Image.network(
            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
            height: 120,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover
          ),
        )
      ),
    );
  }
}