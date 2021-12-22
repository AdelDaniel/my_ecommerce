import 'package:get_it/get_it.dart';
import 'bloc/cart_bloc.dart';

import 'repositories/cart_repository.dart';

Future<void> cartInjectionContainersetup(GetIt sl) async {
//! Feature - Cart
// Bloc
  sl.registerLazySingleton(
      () => CartBloc(cartRepository: sl())..add(const CreateCartEvent()));
// Repository
  sl.registerLazySingleton(() => CartRepository());
}
