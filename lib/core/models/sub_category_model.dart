class SubCategoryModel {
  final String name, image;
  SubCategoryModel({required this.name, required this.image});
}

final List<SubCategoryModel> subCategories = [
  SubCategoryModel(
    name: "Bags",
    image: "assets/images/subcategories/bags.webp",
  ),
  SubCategoryModel(
    name: "Wallets",
    image: "assets/images/subcategories/wallets.png",
  ),
  SubCategoryModel(
    name: "Footwear",
    image: "assets/images/subcategories/footwear.png",
  ),
  SubCategoryModel(
    name: "Clothes",
    image: "assets/images/subcategories/clothes.png",
  ),
  SubCategoryModel(
    name: "Watch",
    image: "assets/images/subcategories/watch.png",
  ),
  SubCategoryModel(
    name: "Makeup",
    image: "assets/images/subcategories/makeup.png",
  ),
];
