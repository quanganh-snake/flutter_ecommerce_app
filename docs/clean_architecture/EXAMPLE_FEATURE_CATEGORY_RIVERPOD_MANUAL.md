# EXAMPLE FEATURE **CATEGORY**

## Core

### Core - Errors: `lib/core/errors/failure.dart`

```dart
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

```

### Core - result: `lib/core/utils/result.dart`

```dart
import 'package:flutter_ecommerce/core/errors/failure.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);
}

```

## 1. Domain Layer (KHÔNG phụ thuộc Flutter)

### 1.1. Entity

📁 `domain/entities/category_entity.dart`

```dart
class CategoryEntity {
  final String id;
  final String name;
  final String imageUrl;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

```

### 1.2. Repository contract (CRUD đầy đủ)

📁 `domain/repositories/category_repository.dart`

```dart
import '../entities/category_entity.dart';
import '../../../core/utils/result.dart';

abstract class CategoryRepository {
  Result<List<CategoryEntity>> getCategories();
  Result<void> createCategory(CategoryEntity category);
  Result<void> updateCategory(CategoryEntity category);
  Result<void> deleteCategory(String id);
}

```

### 1.3. UseCases

#### 1.3.1. CREATE: 📁 `domain/usecases/create_category_usecase.dart`

```dart
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';
import '../core/utils/result.dart';

class CreateCategoryUsecase {
  final CategoryRepository repository;
  CreateCategoryUsecase(this.repository);

  Result<void> call(CategoryEntity category) {
    return repository.createCategory(category);
  }
}

```

#### 1.3.2. UPDATE: 📁 `domain/usecases/update_category_usecase.dart`

```dart
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';
import '../core/utils/result.dart';

class UpdateCategoryUsecase {
  final CategoryRepository repository;
  UpdateCategoryUsecase(this.repository);

  Result<void> call(CategoryEntity category) {
    return repository.updateCategory(category);
  }
}

```

#### 1.3.3. DELETE: 📁 `domain/usecases/delete_category_usecase.dart`

```dart
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';
import '../core/utils/result.dart';

class DeleteCategoryUsecase {
  final CategoryRepository repository;
  DeleteCategoryUsecase(this.repository);

  Result<void> call(String id) {
    return repository.deleteCategory(id);
  }
}

```

#### 1.3.4. GET ALL: 📁 `domain/usecases/get_categories_usecase.dart`

```dart
import '../entities/category_entity.dart';
import '../repositories/category_repository.dart';
import '../../../core/utils/result.dart';

class GetCategoriesUsecase {
  final CategoryRepository repository;

  GetCategoriesUsecase(this.repository);

  Future<Result<List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}

```

### 1.4. Validation (package: fromz)

#### 1.4.1. Validate category_name: 📁 `domain/validators/category_name.dart`

```dart
import 'package:formz/formz.dart';

enum CategoryNameError { empty }

class CategoryName extends FormzInput<String, CategoryNameError> {
  const CategoryName.pure() : super.pure('');
  const CategoryName.dirty(super.value) : super.dirty();

  @override
  CategoryNameError? validator(String value) {
    return value.isEmpty ? CategoryNameError.empty : null;
  }
}
```

#### 1.4.1. Validate category_image_url: 📁 `domain/validators/category_image_url.dart`

```dart
enum CategoryImageUrlError { empty }

class CategoryImageUrl extends FormzInput<String, CategoryImageUrlError> {
  const CategoryImageUrl.pure() : super.pure('');
  const CategoryImageUrl.dirty(super.value) : super.dirty();

  @override
  CategoryImageUrlError? validator(String value) {
    return value.isEmpty ? CategoryImageUrlError.empty : null;
  }
}

```

## 2. Data Layer - Firebase CRUD

### 2.1. Data - Model: 📁 `data/models/category_model.dart`

```dart
import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory CategoryModel.fromFirestore(Map<String, dynamic> json, String id) {
    return CategoryModel(
      id: id,
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() => {
        'name': name,
        'imageUrl': imageUrl,
      };
}
```

### 2.2. Data - Datasource: 📁 `data/datasources/category_firestore_datasource.dart`

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';

class CategoryFirestoreDatasource {
  final FirebaseFirestore firestore;
  CategoryFirestoreDatasource(this.firestore);

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await firestore.collection('categories').get();
    return snapshot.docs
        .map((d) => CategoryModel.fromFirestore(d.data(), d.id))
        .toList();
  }

  Future<void> create(CategoryModel model) {
    return firestore.collection('categories').add({
      'name': model.name,
      'imageUrl': model.imageUrl,
    });
  }

  Future<void> update(CategoryModel model) {
    return firestore.collection('categories').doc(model.id).update({
      'name': model.name,
      'imageUrl': model.imageUrl,
    });
  }

  Future<void> delete(String id) {
    return firestore.collection('categories').doc(id).delete();
  }
}

```

### 2.3. Data - Repository Implementation : 📁 `data/repositories/category_repository_impl.dart`

```dart
import '../models/category_model.dart';
import '../datasources/category_firestore_datasource.dart';

import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/utils/result.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryFirestoreDatasource datasource;
  CategoryRepositoryImpl(this.datasource);

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    try {
      final data = await datasource.getCategories();
      return Success(data);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void>> createCategory(CategoryEntity category) async {
    try {
      await datasource.create(CategoryModel(
        id: '',
        name: category.name,
        imageUrl: category.imageUrl,
      ));
      return const Success(null);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Result<void>> updateCategory(CategoryEntity category) async {
    try {
      await datasource.update(CategoryModel(
        id: category.id,
        name: category.name,
        imageUrl: category.imageUrl,
      ));
      return const Success(null);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Result<void>> deleteCategory(String id) async {
    try {
      await datasource.delete(id);
      return const Success(null);
    } catch (e) {
      return Error(ServerFailure(e.toString()));
    }
  }
}

```

👉 Domain không biết Firebase

👉 UI không biết Firestore

## 3. Presentation Layer (Flutter + Riverpod Provider + Form + CRUD)

### 3.1. Form State (formz): 📁 `presentation/providers/category_form_state.dart`

```dart
import 'package:formz/formz.dart';
import '../../../domain/validators/category_name.dart';
import '../../../domain/validators/category_image_url.dart';

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

```

### 3.2. Form Notifier (Create & Update): 📁 `presentation/providers/category_form_notifier.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/create_category_usecase.dart';
import '../../../domain/usecases/update_category_usecase.dart';
import '../../../domain/validators/category_name.dart';
import '../../../domain/validators/category_image_url.dart';

import 'category_form_state.dart';

class CategoryFormNotifier extends StateNotifier<CategoryFormState> {
  final CreateCategoryUsecase create;
  final UpdateCategoryUsecase update;

  CategoryFormNotifier(this.create, this.update)
      : super(const CategoryFormState());

  void nameChanged(String v) =>
      state = state.copyWith(name: CategoryName.dirty(v));

  void imageChanged(String v) =>
      state = state.copyWith(imageUrl: CategoryImageUrl.dirty(v));

  void reset() => state = const CategoryFormState();

  Future<void> submit({String? id}) async {
    if (!state.isValid) return;

    state = state.copyWith(status: FormzSubmissionStatus.inProgress);

    final entity = CategoryEntity(
      id: id ?? '',
      name: state.name.value,
      imageUrl: state.imageUrl.value,
    );

    final result =
        id == null ? await create(entity) : await update(entity);

    if (result is Error) {
      state = state.copyWith(status: FormzSubmissionStatus.failure);
    } else {
      state = state.copyWith(status: FormzSubmissionStatus.success);
    }
  }
}

```

### 3.3. Delete Notifier: 📁 `presentation/providers/delete_category_notifier.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/delete_category_usecase.dart';

class DeleteCategoryNotifier extends StateNotifier<AsyncValue<void>> {
  final DeleteCategoryUsecase delete;

  DeleteCategoryNotifier(this.delete)
      : super(const AsyncData(null));

  Future<void> call(String id) async {
    state = const AsyncLoading();
    final result = await delete(id);

    if (result is Error) {
      state = AsyncError(result.failure.message, StackTrace.current);
    } else {
      state = const AsyncData(null);
    }
  }
}

```

### 3.3. Get Category List: 📁 `presentation/providers/category_list_provider.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/usecases/get_categories_usecase.dart';

final categoryListProvider =
    FutureProvider<List<CategoryEntity>>((ref) async {
  final usecase = ref.watch(getCategoriesUsecaseProvider);
  final result = await usecase();

  if (result is Error) {
    throw result.failure.message;
  }

  return (result as Success<List<CategoryEntity>>).data;
});


```

### 3.4. Category Usecase Provider: 📁 `presentation/providers/category_usecase_providers.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/create_category_usecase.dart';
import '../../domain/usecases/update_category_usecase.dart';
import '../../domain/usecases/delete_category_usecase.dart';
import '../../domain/repositories/category_repository.dart';
import 'category_repository_provider.dart';

final createCategoryUsecaseProvider =
    Provider<CreateCategoryUsecase>((ref) {
  final repo = ref.watch(categoryRepositoryProvider);
  return CreateCategoryUsecase(repo);
});

final updateCategoryUsecaseProvider =
    Provider<UpdateCategoryUsecase>((ref) {
  final repo = ref.watch(categoryRepositoryProvider);
  return UpdateCategoryUsecase(repo);
});

final deleteCategoryUsecaseProvider = Provider<DeleteCategoryUsecase>((ref) {
  final repo = ref.watch(categoryRepositoryProvider);
  return DeleteCategoryUsecase(repo);
});

```

### 3.5. Category Form Provider: 📁 `presentation/providers/category_form_provider.dart`

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_form_notifier.dart';
import 'category_form_state.dart';
import 'category_usecase_providers.dart';

final categoryFormProvider =
    StateNotifierProvider<CategoryFormNotifier, CategoryFormState>((ref) {
  final createUsecase = ref.watch(createCategoryUsecaseProvider);
  final updateUsecase = ref.watch(updateCategoryUsecaseProvider);

  return CategoryFormNotifier(createUsecase, updateUsecase);
});

```

### 3.6. Screen: 📁 `presentation/screens/category_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/category_provider.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: categories.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) {
            final c = items[index];
            return ListTile(
              title: Text(c.name),
              leading: Image.network(c.imageUrl, width: 40),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}

```
