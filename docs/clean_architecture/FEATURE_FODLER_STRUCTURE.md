```
lib/features/category/
├── data/
│   ├── datasources/
│   │   └── category_firestore_datasource.dart
│   ├── models/
│   │   └── category_model.dart
│   └── repositories/
│       └── category_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── category_entity.dart
│   ├── repositories/
│   │   └── category_repository.dart
│   ├── usecases/
│   │   ├── get_categories_usecase.dart
│   │   ├── create_category_usecase.dart
│   │   ├── update_category_usecase.dart
│   │   └── delete_category_usecase.dart
│   └── validators/
│       ├── category_name.dart
│       └── category_image_url.dart
└── presentation/
    ├── admin/
    │   ├── providers/
    │   │   ├── category_repository_provider.dart
    │   │   ├── category_usecase_providers.dart
    │   │   ├── category_list_provider.dart
    │   │   ├── category_form_state.dart
    │   │   ├── category_form_provider.dart
    │   │   └── delete_category_provider.dart
    │   ├── screens/
    │   │   ├── category_list_screen.dart
    │   │   ├── category_create_screen.dart
    │   │   └── category_edit_screen.dart
    │   └── widgets/
    │       └── category_form.dart
    └── user/
        ├── providers/
        │   └── category_list_provider.dart
        └── screens/
            └── category_screen.dart

```
