import 'package:formz/formz.dart';

enum CategoryImageUrlError { empty }

class CategoryImageUrl extends FormzInput<String, CategoryImageUrlError> {
  const CategoryImageUrl.pure() : super.pure('');
  const CategoryImageUrl.dirty(super.value) : super.dirty();

  @override
  CategoryImageUrlError? validator(String value) {
    return value.trim().isEmpty ? CategoryImageUrlError.empty : null;
  }
}
