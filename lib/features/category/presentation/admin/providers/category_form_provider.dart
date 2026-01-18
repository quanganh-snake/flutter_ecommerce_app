import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/validators/category_image_url.dart';
import '../../../domain/validators/category_name.dart';
import '../../../../../core/utils/result.dart';

import 'category_form_state.dart';
import 'category_usecase_providers.dart';
import 'category_list_provider.dart';

part 'category_form_provider.g.dart';

@riverpod
class CategoryForm extends _$CategoryForm {
  @override
  CategoryFormState build() => const CategoryFormState();

  void nameChanged(String v) {
    state = state.copyWith(name: CategoryName.dirty(v));
  }

  void imageChanged(String v) {
    state = state.copyWith(imageUrl: CategoryImageUrl.dirty(v));
  }

  void fill({required String name, required String imageUrl}) {
    state = state.copyWith(
      name: CategoryName.dirty(name),
      imageUrl: CategoryImageUrl.dirty(imageUrl),
    );
  }

  void reset() => state = const CategoryFormState();

  Future<void> submit({String? id}) async {
    if (!state.isValid) return;

    state = state.copyWith(status: FormzSubmissionStatus.inProgress);

    final entity = CategoryEntity(
      id: id ?? '',
      name: state.name.value,
      imageUrl: state.imageUrl.value,
    );

    final result = id == null
        ? await ref.read(createCategoryUsecaseProvider)(entity)
        : await ref.read(updateCategoryUsecaseProvider)(entity);

    if (result is Error<void>) {
      state = state.copyWith(status: FormzSubmissionStatus.failure);
      return;
    }

    // refresh list
    ref.invalidate(adminCategoryListProvider);

    state = state.copyWith(status: FormzSubmissionStatus.success);
  }
}
