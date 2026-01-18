import '../../../../core/utils/result.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Result<List<CategoryEntity>>> getCategories();
  Future<Result<void>> createCategory(CategoryEntity category);
  Future<Result<void>> updateCategory(CategoryEntity category);
  Future<Result<void>> deleteCategory(String id);
}
