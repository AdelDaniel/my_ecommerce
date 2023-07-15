// getIt
// https://resocoder.com/2019/10/21/flutter-tdd-clean-architecture-course-13-dependency-injection-user-interface/

import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/core/utils/date_coverter.dart';
import 'package:my_ecommerce/features/auth/auth_injection_containers.dart';
import 'package:my_ecommerce/features/category/category_injection_containers.dart';
import 'package:my_ecommerce/features/checkout/checkout_injection_container.dart';
import 'package:my_ecommerce/features/internet_connection/internet_connection_injection_containers.dart';
import 'package:my_ecommerce/features/product/product_injection_containers.dart';
import 'package:my_ecommerce/features/wish_list/wish_list_injection_containers.dart';

import 'core/utils/curreny_converter.dart';
import 'features/cart/cart_injection_container.dart';

final GetIt sl = GetIt.instance;
Future<void> setup() async {
//! Features
// Bloc
// useCases
// Repository
// Data sources

//! Core
  sl.registerLazySingleton(() => const CurrencyConverter());
  sl.registerLazySingleton(() => const DateConverter());

//! other injection Containers

  internetConnectionInjectionContainerSetup(sl);
  await wishListInjectionContainerSetup(sl);
  await cartInjectionContainersetup(sl);
  await categoryInjectionContainersetup(sl);
  await productInjectionContainersetup(sl);
  await checkoutInjectionContainersetup(sl);
  await authInjectionContainerSetup(sl);
}
