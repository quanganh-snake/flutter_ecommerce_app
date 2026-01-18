import 'package:flutter/material.dart';
import '../../../../../core/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE
          Expanded(
            child: Container(
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
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Category & Rating & Review
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "H&M",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.star, size: 14, color: Colors.amber.shade400),
              const SizedBox(width: 4),
              Text(
                product.rating.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                "(${product.review})",
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // NAME
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),

          // PRICE
          Row(
            children: [
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 190, 26, 14),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "\$${(product.price + 175).toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
