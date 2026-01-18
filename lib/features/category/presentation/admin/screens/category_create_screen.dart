import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../providers/category_form_provider.dart';
import '../widgets/category_form.dart';

class CategoryCreateScreen extends ConsumerWidget {
  const CategoryCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(categoryFormProvider);

    ref.listen(categoryFormProvider, (prev, next) {
      if (next.status.isSuccess) Navigator.pop(context);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Thêm mới danh mục')),
      body: CategoryFormWidget(
        nameErrorText: form.name.isValid ? null : 'Tên danh mục là bắt buộc',
        imageErrorText: form.imageUrl.isValid
            ? null
            : 'Đường dẫn hình ảnh là bắt buộc',
        onNameChanged: (v) =>
            ref.read(categoryFormProvider.notifier).nameChanged(v),
        onImageChanged: (v) =>
            ref.read(categoryFormProvider.notifier).imageChanged(v),
        onSubmit: () => ref.read(categoryFormProvider.notifier).submit(),
        submitting: form.status.isInProgress,
      ),
    );
  }
}
