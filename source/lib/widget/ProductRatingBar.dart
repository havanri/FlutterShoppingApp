import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sheinshop/entity/Product.dart';

class ProductRatingBar extends StatelessWidget {
  const ProductRatingBar({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBarIndicator(
          rating: product.rating!.rate!,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Color(0xFFFBFD01),
          ),
          itemSize: 13,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            '(${product.rating!.count!})',style: TextStyle(color: Colors.black54),
          ),
        )
      ],
    );
  }
}