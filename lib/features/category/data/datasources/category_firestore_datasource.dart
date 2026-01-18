import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';

class CategoryFirestoreDatasource {
  final FirebaseFirestore firestore;
  CategoryFirestoreDatasource(this.firestore);

  CollectionReference<Map<String, dynamic>> get _col =>
      firestore.collection('categories');

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await _col.get();
    return snapshot.docs
        .map((d) => CategoryModel.fromFirestore(d.data(), d.id))
        .toList();
  }

  Future<void> create(CategoryModel model) {
    return _col.add(model.toFirestore());
  }

  Future<void> update(CategoryModel model) {
    return _col.doc(model.id).update(model.toFirestore());
  }

  Future<void> delete(String id) {
    return _col.doc(id).delete();
  }
}
