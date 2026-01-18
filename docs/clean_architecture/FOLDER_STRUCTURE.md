# Folder Structure

```
lib/
├── bootstrap.dart
├── main.dart
├── firebase_options.dart

├── core/
│   ├── config/
│   │   ├── app_constants.dart
│   │   ├── env.dart
│   │   ├── flavor_config.dart
│   │   └── firebase_config.dart
│   │
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   │
│   ├── network/
│   │   ├── http_client.dart
│   │   └── connectivity_service.dart
│   │
│   ├── storage/
│   │   └── secure_storage_service.dart
│   │
│   ├── router/
│   │   ├── app_router.dart
│   │   ├── route_names.dart
│   │   └── route_guards.dart
│   │
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── app_colors.dart
│   │
│   ├── utils/
│   │   ├── debounce.dart
│   │   ├── extensions.dart
│   │   ├── logger.dart
│   │   └── validators.dart
│   │
│   └── widgets/
│       ├── app_button.dart
│       ├── app_text_field.dart
│       └── empty_state.dart

├── features/

│   ├── auth/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── auth_firebase_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── user_model.dart
│   │   │   │   └── auth_credential_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       ├── signup_usecase.dart
│   │   │       └── logout_usecase.dart
│   │   │
│   │   └── presentation/
│   │       ├── providers/
│   │       │   ├── auth_provider.dart
│   │       │   └── auth_state.dart
│   │       └── screens/
│   │           ├── login_screen.dart
│   │           └── signup_screen.dart

│   ├── category/
│   │
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── category_firestore_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── category_model.dart
│   │   │   └── repositories/
│   │   │       └── category_repository_impl.dart
│   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── category_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── category_repository.dart
│   │   │   ├── usecases/
│   │   │   │   ├── get_categories_usecase.dart
│   │   │   │   ├── create_category_usecase.dart
│   │   │   │   ├── update_category_usecase.dart
│   │   │   │   └── delete_category_usecase.dart
│   │   │   └── validators/
│   │   │       ├── category_name.dart
│   │   │       └── category_image_url.dart
│   │
│   │   └── presentation/
│   │       ├── admin/
│   │       │   ├── providers/
│   │       │   │   ├── category_list_provider.dart
│   │       │   │   ├── category_form_provider.dart
│   │       │   │   └── category_action_provider.dart
│   │       │   ├── screens/
│   │       │   │   ├── category_list_screen.dart
│   │       │   │   ├── category_create_screen.dart
│   │       │   │   └── category_edit_screen.dart
│   │       │   └── widgets/
│   │       │       └── category_form.dart
│   │       │
│   │       └── user/
│   │           ├── providers/
│   │           │   └── category_list_provider.dart
│   │           └── screens/
│   │               └── category_screen.dart


│   ├── product/
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── product_firestore_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── product_model.dart
│   │   │   └── repositories/
│   │   │       └── product_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── product_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── product_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_products_usecase.dart
│   │   │       └── get_product_detail_usecase.dart
│   │   │
│   │   └── presentation/
│   │       ├── admin/
│   │       │   └── screens/
│   │       │       └── product_management_screen.dart
│   │       ├── user/
│   │       │   └── screens/
│   │       │       ├── product_detail_screen.dart
│   │       │       └── product_list_screen.dart
│   │       └── widgets/

│   ├── dashboard/
│   │   └── presentation/
│   │       ├── admin/
│   │       │   └── dashboard_admin_screen.dart
│   │       └── user/
│   │           └── dashboard_user_screen.dart

│   ├── order/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/

│   ├── profile/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/

│   └── settings/
│       └── presentation/

├── shared/
│   ├── enums/
│   │   ├── user_role.dart
│   │   └── order_status.dart
│   └── mocks/

```
