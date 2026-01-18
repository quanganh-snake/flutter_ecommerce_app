import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../core/utils/result.dart';
import './category_usecase_providers.dart';
import './category_list_provider.dart';

part 'delete_category_provider.g.dart';

@riverpod
class DeleteCategory extends _$DeleteCategory {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> call(String id) async {
    state = const AsyncLoading();

    final result = await ref.read(deleteCategoryUsecaseProvider)(id);

    if (result is Error<void>) {
      state = AsyncError(result.failure.message, StackTrace.current);
      return;
    }

    ref.invalidate(adminCategoryListProvider);
    state = const AsyncData(null);
  }
}
