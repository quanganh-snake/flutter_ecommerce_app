import 'package:formz/formz.dart';
import '../../../domain/validators/category_image_url.dart';
import '../../../domain/validators/category_name.dart';

class CategoryFormState {
  final CategoryName name;
  final CategoryImageUrl imageUrl;
  final FormzSubmissionStatus status;

  const CategoryFormState({
    this.name = const CategoryName.pure(),
    this.imageUrl = const CategoryImageUrl.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  bool get isValid => Formz.validate([name, imageUrl]);

  CategoryFormState copyWith({
    CategoryName? name,
    CategoryImageUrl? imageUrl,
    FormzSubmissionStatus? status,
  }) {
    return CategoryFormState(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
    );
  }
}
