import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/datasources/category_firestore_datasource.dart';
import '../../../data/repositories/category_repository_impl.dart';
import '../../../domain/repositories/category_repository.dart';

part 'category_repository_provider.g.dart';

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final firestore = FirebaseFirestore.instance;
  final datasource = CategoryFirestoreDatasource(firestore);
  return CategoryRepositoryImpl(datasource);
}
