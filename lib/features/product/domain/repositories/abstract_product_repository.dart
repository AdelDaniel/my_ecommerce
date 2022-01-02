import 'package:my_ecommerce/models/models.dart';

abstract class AbstractProductRepository {
  const AbstractProductRepository();
  Stream<List<Product>> getAllProducts();
}
