import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/models/product_model.dart';
import 'package:flutter_ecommerce/features/user/home/data/models/category_model.dart';
import 'package:flutter_ecommerce/features/user/home/presentations/widgets/filter_chip_item.dart';
import 'package:flutter_ecommerce/features/user/home/presentations/widgets/product_card.dart';
import 'package:iconsax/iconsax.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;
  final List<ProductModel> products;

  const CategoryProductsScreen({
    super.key,
    required this.categoryName,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(categoryName),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [_buildFilterBar(), _buildCategoryBar(), _buildProductGrid()],
      ),
    );
  }
}

AppBar _buildAppBar(String categoryName) {
  return AppBar(
    backgroundColor: Colors.white,
    titleSpacing: 0,
    title: Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintText: "$categoryName's Fashion",
            filled: true,
            fillColor: Colors.grey.shade100,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    ),
  );
}

SliverToBoxAdapter _buildFilterBar() {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          FilterChipItem(
            label: "Popular",
            isSelected: true,
            icon: Iconsax.star,
          ),
          FilterChipItem(label: "New Arrival"),
          FilterChipItem(label: "Best Rating", icon: Iconsax.like),
          FilterChipItem(
            label: "Price: Low to High",
            icon: Iconsax.arrow_down_1,
          ),
          FilterChipItem(label: "Price: High to Low", icon: Iconsax.arrow_up_1),
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildCategoryBar() {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 92,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey.shade100,
                child: const Icon(Iconsax.category),
              ),
              const SizedBox(height: 6),
              Text(categories[index].name),
            ],
          );
        },
      ),
    ),
  );
}

SliverPadding _buildProductGrid() {
  return SliverPadding(
    padding: const EdgeInsets.all(16),
    sliver: SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ProductCard(product: products[index]);
      }, childCount: products.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
    ),
  );
}
