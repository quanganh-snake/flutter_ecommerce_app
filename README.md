# 🚀 Tech Stack

- `State management`: flutter_riverpod

- `Routing`: go_router

- `HTTP`: dio

- `JSON`: json_serializable

- `Env`: flutter_dotenv

- `Logger`: logger

- `Secure storage`: flutter_secure_storage

- `Connectivity`: connectivity_plus

# 🎨 UI & UX

- `Fonts`: google_fonts

- `Icons`: flutter_svg

- `Animation`: flutter_animate

- `Shimmer`: shimmer

- `Responsive`: flutter_screenutil

# Kiến trúc sử dụng: **Feature-first**

- Mỗi một module = 1 feature

## Clean Architecture bên trong mỗi feature

```dart

presentation → domain → data

```

## presentation

==> Vai trò: UI + Riverpod

## domain

==> Vai trò: Business logic, usecase

## data

==> Vai trò: API, cache, Firebase
