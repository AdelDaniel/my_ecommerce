import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/features/wish_list/presentation/bloc/wishlist_bloc.dart';
import 'package:my_ecommerce/widgets/widgets.dart';

import '../l10n/l10n.dart';
import '../widgets/custom_app_bar.dart';
import 'language_settings/change_language_widget.dart';
import 'theme_settings/change_theme_widget.dart';
import 'theme_settings/cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SettingsScreen(),
      );

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context).settings,
      ),
      body: SafeArea(
        child: Column(children: [
          ChangeLanguageWidget(
            locale: Localizations.localeOf(context),
            flag: L10n.getFlag(Localizations.localeOf(context).languageCode),
          ),
          ChangeThemeWidget(
            themeCubit: BlocProvider.of<ThemeCubit>(context),
          ),
          MainNavBarButton(
            onPressed: () =>
                context.read<WishlistBloc>().add(const RemoveAllWishList()),
            buttonText: "Remove All Products In WishList",
            height: 40,
          ),
          MainNavBarButton(
            onPressed: () =>
                context.read<AuthBloc>().add(const AuthEvent.signOut()),
            buttonText: "Sign Out",
            height: 40,
          )
        ]),
      ),
    );
  }
}
