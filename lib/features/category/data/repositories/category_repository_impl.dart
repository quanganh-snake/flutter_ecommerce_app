import '../../../../core/errors/failure.dart';
import '../../../../core/utils/result.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_firestore_datasource.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryFirestoreDatasource datasource;
  CategoryRepositoryImpl(this.datasource);

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    try {
      final data = await datasource.getCategories();
      return Success(data);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> createCategory(CategoryEntity category) async {
    try {
      await datasource.create(
        CategoryModel(id: '', name: category.name, imageUrl: category.imageUrl),
      );
      return const Success(null);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateCategory(CategoryEntity category) async {
    try {
      await datasource.update(
        CategoryModel(
          id: category.id,
          name: category.name,
          imageUrl: category.imageUrl,
        ),
      );
      return const Success(null);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteCategory(String id) async {
    try {
      await datasource.delete(id);
      return const Success(null);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}
