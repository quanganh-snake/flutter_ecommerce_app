import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/utils/result.dart';
import '../../../domain/entities/category_entity.dart';
import 'category_usecase_providers.dart';

part 'category_list_provider.g.dart';

@riverpod
Future<List<CategoryEntity>> adminCategoryList(Ref ref) async {
  final usecase = ref.watch(getCategoriesUsecaseProvider);
  final result = await usecase();

  if (result is Error<List<CategoryEntity>>) {
    throw result.failure.message;
  }
  return (result as Success<List<CategoryEntity>>).data;
}
