import 'package:my_ecommerce/features/checkout/datasources/checkout_firebase_data_source.dart';
import 'package:my_ecommerce/features/checkout/models/checkout_model.dart';

abstract class BaseCheckoutRepository {
  const BaseCheckoutRepository();
  Future<void> addCheckout(Checkout checkout);
}

class CheckoutRepository extends BaseCheckoutRepository {
  final CheckoutFirebaseDataSource _checkoutFirebase;
  const CheckoutRepository(
      {required CheckoutFirebaseDataSource checkoutFirebase})
      : _checkoutFirebase = checkoutFirebase;

  @override
  Future<void> addCheckout(Checkout checkout) async {
    try {
      _checkoutFirebase.saveCheckoutAtFireStore(checkout);
    } catch (e) {
      rethrow;
    }
  }
}
