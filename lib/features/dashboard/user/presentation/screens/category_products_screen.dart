import 'package:flutter/material.dart';
import '../../../../../core/models/product_model.dart';
import '../../../../../core/models/category_model.dart';
import '../../../../../core/models/sub_category_model.dart';
import 'product_detail_screen.dart';
import '../widgets/filter_chip_item.dart';
import '../widgets/product_card.dart';

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
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            filterCatgory.length,
            (index) => FilterChipItem(
              label: filterCatgory[index],
              icon: Icons.filter_list,
            ),
          ),
        ),
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
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => {},
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey.shade100,
                    child: Image.asset(
                      subCategories[index].image,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(subCategories[index].name),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

SliverPadding _buildProductGrid() {
  return SliverPadding(
    padding: const EdgeInsets.all(16),
    sliver: products.isEmpty
        ? const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "No products available in this category.",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          )
        : SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ProductCard(
                product: products[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailScreen(product: products[index]);
                      },
                    ),
                  );
                },
              );
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
