import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Center(
      child: Column(
        children: [
          Title(
              color: Colors.black,
              child: Text(
                  ' ${AppLocalizations.of(context).language}: ${locale.languageCode} $flag')),
          for (Locale item in L10n.all)
            TextButton(
              onPressed: () =>
                  BlocProvider.of<LanguageCubit>(context).changeLanguage(item),
              child: Text(
                '${L10n.getFlag(item.languageCode)}: ${L10n.getLanguageName(item.languageCode)} ${item.languageCode}',
                textDirection: TextDirection.ltr,
              ),
            ),
        ],
      ),
    );
  }
}
