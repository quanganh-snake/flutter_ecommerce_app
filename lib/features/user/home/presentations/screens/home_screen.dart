import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/core/models/product_model.dart';
import 'package:flutter_ecommerce/features/user/home/data/models/category_model.dart';
import 'package:flutter_ecommerce/features/user/home/presentations/screens/category_products_screen.dart';
import 'package:flutter_ecommerce/features/user/home/presentations/screens/product_detail_screen.dart';
import 'package:flutter_ecommerce/features/user/home/presentations/widgets/curated_product_item.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_ecommerce/features/user/home/presentations/widgets/banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: null,
        leading: Image.asset(
          "assets/images/logo_market.png",
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Iconsax.shopping_bag,
                  size: 28,
                  color: Colors.black54,
                ),
                Positioned(
                  right: -2,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const HomeBanner(),
              // BEGIN: Catgories
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Danh mục nổi bật",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Xem tất cả",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => InkWell(
                      onTap: () {
                        // Filter products based on the selected category
                        final filterItems = products
                            .where(
                              (item) =>
                                  item.category.name.toLowerCase() ==
                                  categories[index].name.toLowerCase(),
                            )
                            .toList();

                        // Navigate to the category items screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryProductsScreen(
                              categoryName: categories[index].name,
                              products: filterItems,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Image.asset(
                                categories[index].image,
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index].name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // END: Catgories

              // BEGIN: Curated For You
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gợi ý cho bạn",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Xem tất cả",
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(products.length, (index) {
                    final eCommerceItem = products[index];
                    return Padding(
                      padding: index == 0
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailScreen(
                                  product: eCommerceItem,
                                );
                              },
                            ),
                          );
                        },
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: CuratedProductItem(
                          product: eCommerceItem,
                          size: size,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // END: Curated For You
            ],
          ),
        ),
      ),
    );
  }
}
