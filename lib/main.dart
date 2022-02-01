import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/auth/application/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:my_ecommerce/features/category/presentation/bloc/category_bloc.dart';
import 'package:my_ecommerce/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:my_ecommerce/features/checkout/repositories/base_checkout_repository.dart';
import 'package:my_ecommerce/features/product/data/repositories/product_repository_impl.dart';
import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:my_ecommerce/screens/splash_screen.dart';
import 'package:path_provider/path_provider.dart';

import 'all_injection_containers.dart' as di;
import 'core/config/app_routing.dart';
import 'core/config/firebase_init.dart' as firebase;
import 'core/config/hive_init.dart' as hive;
import 'features/cart/bloc/cart_bloc.dart';
import 'features/wish_list/presentation/bloc/wishlist_bloc.dart';
import 'l10n/l10n.dart';
import 'settings/language_settings/cubit/language_cubit.dart';
import 'settings/theme_settings/cubit/theme_cubit.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // init
  await hive.hiveInit();
  await di.setup();
  await firebase.firebaseInit();

  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(create: (_) => di.sl<WishlistBloc>()),
        BlocProvider<CartBloc>(create: (_) => di.sl<CartBloc>()),
        BlocProvider<CategoryBloc>(create: (_) => di.sl<CategoryBloc>()),
        BlocProvider<SignInFormBloc>(create: (_) => di.sl<SignInFormBloc>()),
        BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>()),
        // TODO :: clean the coming next bloc product and checkout like the previous
        BlocProvider<ProductBloc>(
            create: (newContext) => ProductBloc(
                  wishlistBloc: newContext.read<WishlistBloc>(),
                  productRepository: di.sl<ProductRepository>(),
                )..add(const LoadProductEvent())),
        BlocProvider<CheckoutBloc>(
            create: (newContext) => CheckoutBloc(
                cartBloc: newContext.read<CartBloc>(),
                repository: di.sl<CheckoutRepository>())),
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: Builder(
        builder: (context) {
          final languageState = context.watch<LanguageCubit>().state;
          final themeState = context.watch<ThemeCubit>().state;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            supportedLocales: L10n.all,
            locale: languageState.locale,
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashScreen.routeName,
            theme: themeState.themeData,
            title: "My eCommerce",
          );
        },
      ),
    );
  }
}
