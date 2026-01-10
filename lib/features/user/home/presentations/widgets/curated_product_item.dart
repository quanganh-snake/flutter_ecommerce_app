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
      children: [
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
          width: size.width * 0.4,
          child: Padding(
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
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "H&M",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.star, color: Colors.amber, size: 16),
            Text(
              product.rating.toString(),
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            Text("${product.review}", style: TextStyle(color: Colors.black26)),
            SizedBox(
              width: size.width * 0.5,
              child: Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
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
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
