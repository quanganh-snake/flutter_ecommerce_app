import 'package:flutter/material.dart';
import '../../../../../core/models/product_model.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          'Detail Product',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Iconsax.shopping_bag, size: 28, color: Colors.black54),
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
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,

      body: ListView(
        children: [
          Container(
            color: Colors.grey[200],
            height: size.height * 0.45,
            width: size.width,
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (builderContext, index) {
                      return Column(
                        children: [
                          Hero(
                            tag: '${widget.product.id}-$index',
                            child: Image.network(
                              widget.product.image,
                              height: size.height * 0.4,
                              width: size
                                  .width, // Chiều rộng của ảnh bằng 85% chiều rộng màn hình
                              fit: BoxFit.cover,
                              repeat: ImageRepeat
                                  .noRepeat, // Không lặp lại ảnh nếu kích thước không đủ
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => InkWell(
                      onTap: () {
                        setState(() {
                          // Cập nhật chỉ số trang hiện tại khi chấm được nhấn
                          currentIndex = index;
                          // Di chuyển đến trang tương ứng
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: index == currentIndex
                              ? Colors.orange
                              : Colors.black26,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      widget.product.rating.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      "(${widget.product.review})",
                      style: const TextStyle(color: Colors.black26),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.favorite_border,
                      color: Colors.red[400],
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    widget.product.name,
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
                      "\$${widget.product.price}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "\$${175 + widget.product.price}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black38,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 2.1, // Chiếm một nửa chiều rộng
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Colors"),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.product.colors
                                  .asMap()
                                  .entries
                                  .map((colorItem) {
                                    final int index = colorItem.key;
                                    final Color colorValue = colorItem.value;
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10,
                                        right: 10.0,
                                      ),
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: colorValue,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedColorIndex = index;
                                            });
                                          },
                                          child: index == selectedColorIndex
                                              ? const Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                )
                                              : null,
                                        ),
                                      ),
                                    );
                                  })
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 2.1, // Chiếm một nửa chiều rộng
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Sizes"),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.product.sizes
                                  .asMap()
                                  .entries
                                  .map((colorItem) {
                                    final int index = colorItem.key;
                                    final String sizeValue = colorItem.value;
                                    return GestureDetector(
                                      onTap: () => setState(() {
                                        selectedSizeIndex = index;
                                      }),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top: 10,
                                          right: 10,
                                        ),
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: index == selectedSizeIndex
                                              ? Colors.orange
                                              : Colors.grey[200],
                                          border: Border.all(
                                            color: index == selectedSizeIndex
                                                ? Colors.black12
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            sizeValue,
                                            style: TextStyle(
                                              color: index == selectedSizeIndex
                                                  ? Colors.white
                                                  : Colors.black54,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.1),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Add to Cart
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.bag_happy, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Buy Now
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      color: Colors.black,
                      child: const Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
