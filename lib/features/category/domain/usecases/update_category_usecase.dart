import '../../../../core/utils/result.dart';

import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';

class UpdateCategoryUsecase {
  final CategoryRepository repository;
  UpdateCategoryUsecase(this.repository);

  Future<Result<void>> call(CategoryEntity category) {
    return repository.updateCategory(category);
  }
}
