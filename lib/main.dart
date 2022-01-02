import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_ecommerce/features/category/presentation/bloc/category_bloc.dart';
import 'package:my_ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'all_injection_containers.dart' as di;
import 'core/config/app_routing.dart';
import 'core/config/firebase_init.dart' as firebase;
import 'core/config/hive_init.dart' as hive;
import 'features/cart/bloc/cart_bloc.dart';
import 'features/wish_list/presentation/bloc/wishlist_bloc.dart';
import 'l10n/l10n.dart';
import 'screens/home_screen/home_screen.dart';
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
        BlocProvider<WishlistBloc>.value(value: di.sl<WishlistBloc>()),
        BlocProvider<CartBloc>.value(value: di.sl<CartBloc>()),
        BlocProvider<CategoryBloc>.value(value: di.sl<CategoryBloc>()),
        BlocProvider<ProductBloc>.value(value: di.sl<ProductBloc>()),
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, languageState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                // supportedLocales: AppLocalizations.supportedLocales,
                supportedLocales: L10n.all,
                locale: languageState.locale,
                onGenerateRoute: onGenerateRoute,
                initialRoute: HomeScreen.routeName,
                theme: themeState.themeData,
                title: "My eCommerce",
              );
            },
          );
        },
      ),
    );
  }
}
