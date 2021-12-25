import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:readmore/readmore.dart';

import '../core/constants/constants.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: constMarginHerizontal),
      child: ReadMoreText(
        text,
        trimMode: TrimMode.Line,
        trimCollapsedText: AppLocalizations.of(context).showMore,
        trimExpandedText: AppLocalizations.of(context).showLess,
        textAlign: TextAlign.start,
        delimiter: "...",
        style: Theme.of(context).textTheme.bodyText2,
        // colorClickableText: Colors.blue,
        trimLines: 3,
        lessStyle: TextStyle(
            color: Colors.blue.shade200, decoration: TextDecoration.underline),
        moreStyle: TextStyle(
            color: Colors.blue.shade200, decoration: TextDecoration.underline),
      ),
    );
  }
}
