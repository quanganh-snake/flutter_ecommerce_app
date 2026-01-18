import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../category/domain/usecases/create_category_usecase.dart';
import '../../../../category/domain/usecases/update_category_usecase.dart';
import '../../../../category/domain/usecases/delete_category_usecase.dart';
import '../../../../category/domain/usecases/get_categories_usecase.dart';
import 'category_repository_provider.dart';

part 'category_usecase_providers.g.dart';

@riverpod
GetCategoriesUsecase getCategoriesUsecase(Ref ref) {
  return GetCategoriesUsecase(ref.watch(categoryRepositoryProvider));
}

@riverpod
CreateCategoryUsecase createCategoryUsecase(Ref ref) {
  return CreateCategoryUsecase(ref.watch(categoryRepositoryProvider));
}

@riverpod
UpdateCategoryUsecase updateCategoryUsecase(Ref ref) {
  return UpdateCategoryUsecase(ref.watch(categoryRepositoryProvider));
}

@riverpod
DeleteCategoryUsecase deleteCategoryUsecase(Ref ref) {
  return DeleteCategoryUsecase(ref.watch(categoryRepositoryProvider));
}
