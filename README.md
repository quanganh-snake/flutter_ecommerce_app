# 🚀 Tech Stack

- `State management`: flutter_riverpod, riverpod_annotation, riverpod_generator (dev_dependencies)

* Lệnh build_runner:

```bash

flutter pub run build_runner build --delete-conflicting-outputs

```

- Lệnh watch khi dev để tự động generate provider với riverpod generator

```bash

flutter pub run build_runner watch

```

- `build_runner`:
  - Tác dụng: Khởi chạy công cụ build_runner.

  - Chi tiết: Trong Flutter, có những mã nguồn không phải do bạn viết tay mà được sinh ra tự động (như file .g.dart hay .freezed.dart). build_runner là trình điều khiển sẽ quét toàn bộ dự án, tìm các thư viện có khả năng tạo code (Generator) và ra lệnh cho chúng làm việc.

- `build`:
  - Tác dụng: Thực hiện việc tạo code một lần duy nhất.

  - Chi tiết: Khi dùng lệnh build, công cụ sẽ quét dự án, tạo ra các file cần thiết rồi kết thúc.

So sánh: Nếu bạn dùng watch thay cho build, nó sẽ giữ trạng thái chạy ngầm, mỗi khi bạn nhấn Ctrl + S (Save) để lưu file, nó sẽ tự động cập nhật code mới ngay lập tức.

- `--delete-conflicting-outputs`:
  - Tác dụng: Tự động xóa và ghi đè lên các file code cũ nếu có xung đột.

  - Tại sao cần nó: \* Trong quá trình làm việc, đôi khi bạn thay đổi tên class, xóa bớt biến hoặc cấu trúc file .g.dart cũ không còn khớp với code hiện tại.

  - Nếu không có cờ này, khi phát hiện file đầu ra đã tồn tại nhưng có nội dung khác biệt, build_runner sẽ dừng lại và hỏi bạn: "Tôi nên làm gì với file cũ này?". Điều này gây gián đoạn quy trình.

  - Cờ này giúp quá trình chạy diễn ra mượt mà, đảm bảo các file sinh ra luôn là mới nhất và khớp hoàn toàn với code bạn vừa viết.

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

- Mỗi một module = 1 feature ==> Đối với feature theo DATA

```
features/
├── auth/
│   └── domain/
│       └── entities/app_user.dart
│
├── product/
│   ├── domain/
│   ├── data/
│   └── presentation/
│       ├── admin/
│       └── user/
│
├── dashboard/
│   ├── admin/
│   │   └── presentation/
│   └── user/
│       └── presentation/

```

- Mỗi một module = 1 feature ==> Đối với feature theo ROLE

```
  features/
  ├── auth/
  ├── product/
  ├── category/
  ├── order/
  ├── dashboard/
  │ ├── admin/
  │ │ └── presentation/
  │ └── user/
  │ └── presentation/
```

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

# 1. bootstrap.dart : Khởi tạo toàn bộ “nền móng” của app trước khi render UI

| Trách nhiệm                   | Có nên làm ở `bootstrap.dart` |
| ----------------------------- | ----------------------------- |
| runApp                        | ✅                            |
| Catch global error            | ✅                            |
| Init DI (Riverpod / GetIt)    | ✅                            |
| Init Firebase                 | ✅                            |
| Init local DB (Hive / Isar)   | ✅                            |
| Init env (dev / prod)         | ✅                            |
| Setup logging                 | ✅                            |
| Setup HTTP override           | ✅                            |
| Setup orientation / system UI | ✅                            |
| Code UI                       | ❌                            |
| Feature logic                 | ❌                            |
