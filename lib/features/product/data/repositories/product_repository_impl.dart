import 'package:my_ecommerce/features/product/data/datasources/product_firebase_data_source.dart';
import 'package:my_ecommerce/features/product/domain/repositories/abstract_product_repository.dart';

import 'package:my_ecommerce/models/models.dart';

class ProductRepository extends AbstractProductRepository {
  final ProductFirebaseDataSource _productFirebaseDataSource;
  const ProductRepository(
      {required ProductFirebaseDataSource productFirebaseDataSource})
      : _productFirebaseDataSource = productFirebaseDataSource;
  @override
  Stream<List<Product>> getAllProducts() {
    return _productFirebaseDataSource.getAllProducts();
  }
}
