import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/auth/domain/i_auth_facade.dart';
import 'package:my_ecommerce/features/auth/firebase_injectable_module.dart';
import 'package:my_ecommerce/features/auth/infrastructure/repositories/firebase_auth_facade.dart';

// TODO :: implement all injection containers Using Injectable package >> reso coder
Future<void> authInjectionContainerSetup(GetIt sl) async {
//! Feature - Logging in app
  // Blocs
  sl.registerLazySingleton<SignInFormBloc>(() =>
      SignInFormBloc(authFacade: sl<IAuthFacade>(), authBloc: sl<AuthBloc>()));
  sl.registerLazySingleton<AuthBloc>(
      () => AuthBloc(authFacade: sl<IAuthFacade>()));

  // Repository
  sl.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
      googleSignIn: sl<GoogleSignIn>(), firebaseAuth: sl<FirebaseAuth>()));

  // firebase && google
  sl.registerLazySingleton<FirebaseAuth>(
      () => FirebaseInjectableModule.firebaseAuth);
  sl.registerLazySingleton<GoogleSignIn>(
      () => FirebaseInjectableModule.googleSingIn);
}
