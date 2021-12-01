// getIt
// https://resocoder.com/2019/10/21/flutter-tdd-clean-architecture-course-13-dependency-injection-user-interface/

import 'package:get_it/get_it.dart';

import 'core/utils/curreny_converter.dart';

final sl = GetIt.instance;
Future<void> setup() async {
//! Features - Number Trivia
// Bloc
// useCases
// Repository
// Data sources

//! Core

  sl.registerLazySingleton(() => const CurrencyConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetWorkInfoImpl(
  //     connectionCheckCubit: sl(),
  //     internetConnectionChecker: sl(),
  //     isConnectedCheckCubit: sl()));

//! External -- packages
}
