import '../../../../core/utils/result.dart';
import '../repositories/category_repository.dart';

class DeleteCategoryUsecase {
  final CategoryRepository repository;
  DeleteCategoryUsecase(this.repository);

  Future<Result<void>> call(String id) {
    return repository.deleteCategory(id);
  }
}
