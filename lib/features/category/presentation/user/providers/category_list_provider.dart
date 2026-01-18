import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/entities/category_entity.dart';
import '../../admin/providers/category_usecase_providers.dart';
import '../../../../../core/utils/result.dart';
part 'category_list_provider.g.dart';

@riverpod
Future<List<CategoryEntity>> categoryList(Ref ref) async {
  final usecase = ref.watch(getCategoriesUsecaseProvider);
  final result = await usecase();

  if (result is Error<List<CategoryEntity>>) throw result.failure.message;
  return (result as Success<List<CategoryEntity>>).data;
}
