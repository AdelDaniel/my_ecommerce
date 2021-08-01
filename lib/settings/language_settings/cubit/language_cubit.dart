import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../../l10n/l10n.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(LanguageState(L10n.all[0]));

  changeLanguage(locale) => emit(LanguageState(locale));

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty)
      return LanguageState(L10n.all[0]);
    else {
      return LanguageState(Locale(json['languageCode']));
    }
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return {
      'languageCode': state.locale.languageCode,
    };
  }
}
