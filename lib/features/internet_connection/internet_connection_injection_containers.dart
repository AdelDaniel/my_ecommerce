import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/features/internet_connection/bloc/internet_connection_bloc.dart';
import 'package:my_ecommerce/features/internet_connection/infrastructure/check_connection_using_url.dart';
import 'package:my_ecommerce/features/internet_connection/infrastructure/network.dart';

void internetConnectionInjectionContainerSetup(GetIt sl) {
  //! Feature - Internet Connection
  // Blocs
  sl.registerLazySingleton<InternetConnectionBloc>(
      () => InternetConnectionBloc(connectionCheck: sl<AbstractNetworkInfo>()));

  // Repository
  sl.registerLazySingleton<AbstractNetworkInfo>(
      () => ConnectivityPlusNetworkInfoRepository(
            checkConnectionUsingUrl: sl<CheckConnectionUsingUrl>(),
            connectivity: sl<Connectivity>(),
          ));
  sl.registerLazySingleton<CheckConnectionUsingUrl>(
      () => CheckConnectionUsingUrl(
            customInterNetAddress: sl<CustomInterNetAddress>(),
          ));
  sl.registerLazySingleton(() => const CustomInterNetAddress());

  //! External -- plugins packages
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}
