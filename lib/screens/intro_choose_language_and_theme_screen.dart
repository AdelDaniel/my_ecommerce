import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/features/auth/application/auth_bloc/auth_bloc.dart';
import 'package:my_ecommerce/l10n/l10n.dart';
import 'package:my_ecommerce/screens/intro_overboard_screen.dart';
import 'package:my_ecommerce/settings/language_settings/change_language_widget.dart';

import 'package:my_ecommerce/settings/theme_settings/change_theme_widget.dart';
import 'package:my_ecommerce/settings/theme_settings/cubit/theme_cubit.dart';
import 'package:my_ecommerce/widgets/main_nav_bar_button.dart';

class IntroChooseLanguageAndThemeScreen extends StatelessWidget {
  const IntroChooseLanguageAndThemeScreen({Key? key}) : super(key: key);
  static const routeName = '/IntroChooseLanguageAndThemeScreen';
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const IntroChooseLanguageAndThemeScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ChangeThemeWidget(
                themeCubit: BlocProvider.of<ThemeCubit>(context),
              ),
            ),
            Expanded(
              child: ChangeLanguageWidget(
                locale: Localizations.localeOf(context),
                flag:
                    L10n.getFlag(Localizations.localeOf(context).languageCode),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: MainNavBarButton(
                height: 50,
                onPressed: () {
                  // the coming event will prevent the app to open this screen again
                  context.read<AuthBloc>().add(const ContinuePressed());
                  Navigator.popAndPushNamed(
                      context, IntroOverboardScreen.routeName);
                },
                buttonText: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
