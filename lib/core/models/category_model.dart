class CategoryModel {
  final String name, image;
  CategoryModel({required this.name, required this.image});
}

final List<CategoryModel> categories = [
  CategoryModel(name: "All", image: "assets/images/categories/all.png"),
  CategoryModel(name: "Women", image: "assets/images/categories/women.png"),
  CategoryModel(name: "Men", image: "assets/images/categories/men.png"),
  CategoryModel(name: "Teen", image: "assets/images/categories/teen.png"),
  CategoryModel(name: "Kid", image: "assets/images/categories/kid.png"),
  CategoryModel(name: "Baby", image: "assets/images/categories/baby.png"),
];

List<String> filterCatgory = [
  'Filter',
  'Ratings',
  'Size',
  'Color',
  'Price',
  'Brand',
];
