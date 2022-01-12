import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../l10n/l10n.dart';
import 'cubit/language_cubit.dart';

class ChangeLanguageWidget extends StatelessWidget {
  final Locale locale;
  final String flag;
  const ChangeLanguageWidget({
    Key? key,
    required this.locale,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Title(
        color: Colors.black,
        child: Text(' ${AppLocalizations.of(context).language}'),
      ),
      const SizedBox(height: 20),
      Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ToggleSwitch(
            animate: true,
            animationDuration: 350,
            curve: Curves.bounceIn,
            borderWidth: 2,
            minWidth: MediaQuery.of(context).size.width * 0.6,
            minHeight: 100.0,
            cornerRadius: 50.0,
            activeBgColors: [
              [Colors.blue[800]!],
              [Colors.green[800]!]
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            initialLabelIndex: L10n.all.indexOf(locale),
            totalSwitches: 2,
            labels: L10n.all
                .map((item) =>
                    '${L10n.getFlag(item.languageCode)}  ${L10n.getLanguageName(item.languageCode)} ')
                .toList(),
            radiusStyle: true,
            onToggle: (index) {
              final local = L10n.all[index];
              BlocProvider.of<LanguageCubit>(context).changeLanguage(local);
            },
          ),
        ),
      ),
    ]);
  }
}
