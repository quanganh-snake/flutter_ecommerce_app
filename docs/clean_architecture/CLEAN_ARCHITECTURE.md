# Clean architecture eCommerce System

# Common Architecture Feature-Fist with Role Base

--> "UI không biết Firebase, Firebase không biết UI – Domain đứng giữa làm luật chơi"

--> 3 Layer trong 1 Feature

```
Presentation  →  Domain  →  Data
(UI)             (Logic)    (Firebase / API)
```

## 1. Presentation (UI layer)

📍 Folder : **presentation/**

- Hiển thị danh sách category
- Gọi usecase
- Không biết Firebase, không query Firestore

👉 Ví dụ:

- CategoryScreen
- CategoryProvider

## 2. Domain (Business logic – trái tim)

📍 Folder : **domain/**

- Định nghĩa Category là gì
- App có thể làm gì với Category
- **KHÔNG import Flutter, Firebase**

👉 Gồm:

- `Entity` → dữ liệu thuần
- `Repository` (abstract class) → hợp đồng
- `UseCase` → hành động

## 3. Data (Implementation)

📍 Folder : **data/**

- Làm việc với Firebase / API
- Convert JSON → Model
- Implement repository

👉 Gồm:

- `Datasource` → Firestore
- `Model` → map dữ liệu
- `RepositoryImpl` → nối Domain ↔ Firebase

## Luồng dữ liệu (rất quan trọng)

```
UI
 ↓
UseCase
 ↓
Repository (abstract)
 ↓
RepositoryImpl
 ↓
Firestore
```
