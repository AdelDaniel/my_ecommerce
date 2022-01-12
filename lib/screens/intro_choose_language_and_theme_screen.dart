import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/screens/home_screen/home_screen.dart';

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
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: MainNavBarButton(
                height: 50,
                onPressed: () =>
                    Navigator.popAndPushNamed(context, HomeScreen.routeName),
                buttonText: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
