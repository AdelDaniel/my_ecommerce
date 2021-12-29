import 'package:my_ecommerce/models/models.dart';

abstract class CategoryRepository {
  const CategoryRepository();
  Stream<List<Category>> getAllCategories();
}
