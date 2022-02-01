import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_auth_facade.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_logging_repository.dart';
import 'package:my_ecommerce/features/auth/domain/interfaces/i_user_firestore_database.dart';
import 'package:my_ecommerce/features/auth/firebase_injectable_module.dart';
import 'package:my_ecommerce/features/auth/infrastructure/data_source/firebase_auth_facade.dart';
import 'package:my_ecommerce/features/auth/infrastructure/data_source/user_firestore_database.dart';
import 'package:my_ecommerce/features/auth/infrastructure/repositories/logging_repository.dart';

// TODO :: implement all injection containers Using Injectable package >> reso coder
Future<void> authInjectionContainerSetup(GetIt sl) async {
//! Feature - Logging in app
  // Blocs
  sl.registerLazySingleton<SignInFormBloc>(() => SignInFormBloc(
      loggingRepository: sl<ILoggingRepository>(), authBloc: sl<AuthBloc>()));
  sl.registerLazySingleton<AuthBloc>(() =>
      AuthBloc(loggingRepository: sl<ILoggingRepository>())
        ..add(const AuthEvent.authCheckRequested()));

  // Repository
  sl.registerLazySingleton<ILoggingRepository>(() => LoggingRepository(
        authFacade: sl<IAuthFacade>(),
        userFirestoreDatabase: sl<IUserFirestoreDatabase>(),
      ));
  sl.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        googleSignIn: sl<GoogleSignIn>(),
        firebaseAuth: sl<FirebaseAuth>(),
      ));
  sl.registerLazySingleton<IUserFirestoreDatabase>(() => UserFirestoreDatabase(
      usersCollectionReference: sl<CollectionReference<Object?>>()));

  // firebase && google
  sl.registerLazySingleton<FirebaseAuth>(
      () => FirebaseInjectableModule.firebaseAuth);
  sl.registerLazySingleton<GoogleSignIn>(
      () => FirebaseInjectableModule.googleSingIn);
  sl.registerLazySingleton<CollectionReference>(
      () => FirebaseInjectableModule.userCollectionReference);
}
