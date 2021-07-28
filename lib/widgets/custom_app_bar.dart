import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/settings_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SettingsScreen())),
        icon: Icon(Icons.settings),
      ),
      centerTitle: true,
      elevation: 25,
      actions: [
        IconButton(
          onPressed: () => {},
          icon: Icon(Icons.favorite),
        )
      ],
      title: Text(AppLocalizations.of(context).title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(5);
}
