import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/models/product_model.dart';

class CuratedProductItem extends StatelessWidget {
  final ProductModel product;
  final Size size;

  const CuratedProductItem({
    super.key,
    required this.product,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
          height: size.height * 0.25,
          width: size.width * 0.5,
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white70,
                child: Icon(Icons.favorite_border, color: Colors.red, size: 20),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "H&M",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    product.rating.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Text(
                    "(${product.review})",
                    style: const TextStyle(color: Colors.black26),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[700],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "\$${175 + product.price}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black26,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
