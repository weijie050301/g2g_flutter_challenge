import 'package:flutter/material.dart';

import 'package:challenge/models/Product.dart';
import 'package:challenge/utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(product.image),
                ),
              ),
            ),
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Text(
              "Update At: ${product.updated}",
              style: const TextStyle(
                fontSize: 11,
                overflow: TextOverflow.ellipsis
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
