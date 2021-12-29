import 'package:my_ecommerce/features/category/data/datasources/firebase_data_source.dart';
import 'package:my_ecommerce/features/category/domain/repositories/category_repository.dart';
import 'package:my_ecommerce/models/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final FirebaseDataSource _firebaseDataSource;
  const CategoryRepositoryImpl({required FirebaseDataSource firebaseDataSource})
      : _firebaseDataSource = firebaseDataSource;
  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseDataSource.getAllCategories();
  }
}
