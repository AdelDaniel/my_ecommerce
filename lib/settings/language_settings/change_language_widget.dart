import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/language_cubit.dart';
import '../../l10n/l10n.dart';

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
                  'current Language code is: ${locale.languageCode} \n and its Flag is $flag')),
          for (Locale item in L10n.all)
            TextButton(
              onPressed: () =>
                  BlocProvider.of<LanguageCubit>(context).changeLanguage(item),
              child: Text(
                  '${L10n.getFlag(item.languageCode)}\n ${item.languageCode}'),
            ),
        ],
      ),
    );
  }
}
