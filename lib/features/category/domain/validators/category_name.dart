import 'package:formz/formz.dart';

enum CategoryNameError { empty }

class CategoryName extends FormzInput<String, CategoryNameError> {
  const CategoryName.pure() : super.pure('');
  const CategoryName.dirty(super.value) : super.dirty();

  @override
  CategoryNameError? validator(String value) {
    return value.trim().isEmpty ? CategoryNameError.empty : null;
  }
}
