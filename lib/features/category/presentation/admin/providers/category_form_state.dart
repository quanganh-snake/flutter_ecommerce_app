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

  /// Method: copyWith
  ///
  /// Mô tả: Tạo một bản sao của đối tượng hiện tại với các thuộc tính được cập nhật.
  ///
  /// Tác dụng: Giúp duy trì tính bất biến của đối tượng trong khi vẫn cho phép cập nhật các thuộc tính cụ thể.
  ///
  /// Tham số:
  ///   - name: Giá trị mới cho thuộc tính 'name'. Nếu không được cung cấp, giữ nguyên giá trị hiện tại.
  ///   - imageUrl: Giá trị mới cho thuộc tính 'imageUrl'. Nếu không được cung cấp, giữ nguyên giá trị hiện tại.
  ///   - status: Giá trị mới cho thuộc tính 'status'. Nếu không được cung cấp, giữ nguyên giá trị hiện tại.
  /// Trả về: Một đối tượng CategoryFormState mới với các thuộc tính
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
