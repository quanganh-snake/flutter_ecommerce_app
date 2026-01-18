import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory CategoryModel.fromFirestore(Map<String, dynamic> json, String id) {
    return CategoryModel(
      id: id,
      name: (json['name'] ?? '') as String,
      imageUrl: (json['imageUrl'] ?? '') as String,
    );
  }

  Map<String, dynamic> toFirestore() => {'name': name, 'imageUrl': imageUrl};
}
