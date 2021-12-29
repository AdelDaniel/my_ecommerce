// getIt
// https://resocoder.com/2019/10/21/flutter-tdd-clean-architecture-course-13-dependency-injection-user-interface/

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/core/networking/check_connection_using_url.dart';
import 'package:my_ecommerce/core/networking/network.dart';
import 'package:my_ecommerce/core/utils/date_coverter.dart';
import 'package:my_ecommerce/features/category/category_injection_containers.dart';
import 'package:my_ecommerce/features/wish_list/wish_list_injection_containers.dart';

import 'core/utils/curreny_converter.dart';
import 'features/cart/cart_injection_container.dart';

final GetIt sl = GetIt.instance;
Future<void> setup() async {
//! Features - Number Trivia
// Bloc
// useCases
// Repository
// Data sources

//! Core
  sl.registerLazySingleton(() => const CurrencyConverter());
  sl.registerLazySingleton(() => const DateConverter());
  sl.registerLazySingleton(() => const CustomInterNetAddress());
  sl.registerLazySingleton(
      () => CheckConnectionUsingUrl(customInterNetAddress: sl()));

  sl.registerLazySingleton<AbstractNetworkInfo>(() =>
      ConnectivityPlusNetworkInfoImpl(
          checkConnectionUsingUrl: sl(), connectivity: sl()));

//! External -- packages
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

//! other injection Containers
  await wishListInjectionContainersetup(sl);
  await cartInjectionContainersetup(sl);
  await categoryInjectionContainersetup(sl);
}
