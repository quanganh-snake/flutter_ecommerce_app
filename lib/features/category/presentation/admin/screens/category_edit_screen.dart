import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../../domain/entities/category_entity.dart';
import '../providers/category_form_provider.dart';
import '../widgets/category_form.dart';

class CategoryEditScreen extends ConsumerStatefulWidget {
  final CategoryEntity category;
  const CategoryEditScreen({super.key, required this.category});

  @override
  ConsumerState<CategoryEditScreen> createState() => _CategoryEditScreenState();
}

class _CategoryEditScreenState extends ConsumerState<CategoryEditScreen> {
  bool _prefilled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_prefilled) return;
    _prefilled = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(categoryFormProvider.notifier)
          .fill(name: widget.category.name, imageUrl: widget.category.imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(categoryFormProvider);

    ref.listen(categoryFormProvider, (prev, next) {
      if (next.status.isSuccess) Navigator.pop(context);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Category')),
      body: CategoryFormWidget(
        initialName: widget.category.name,
        initialImageUrl: widget.category.imageUrl,
        nameErrorText: form.name.isNotValid ? 'Name is required' : null,
        imageErrorText: form.imageUrl.isNotValid
            ? 'Image url is required'
            : null,
        onNameChanged: (v) =>
            ref.read(categoryFormProvider.notifier).nameChanged(v),
        onImageChanged: (v) =>
            ref.read(categoryFormProvider.notifier).imageChanged(v),
        onSubmit: () => ref
            .read(categoryFormProvider.notifier)
            .submit(id: widget.category.id),
        submitting: form.status.isInProgress,
      ),
    );
  }
}
