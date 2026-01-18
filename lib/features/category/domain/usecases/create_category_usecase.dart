import '../../../../core/utils/result.dart';

import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

class CreateCategoryUsecase {
  final CategoryRepository repository;
  CreateCategoryUsecase(this.repository);

  Future<Result<void>> call(CategoryEntity category) {
    return repository.createCategory(category);
  }
}
