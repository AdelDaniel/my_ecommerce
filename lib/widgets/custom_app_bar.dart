import 'package:flutter/material.dart';

import '../screens/wish_list_screen.dart';
import '../settings/settings_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pushNamed(context, SettingsScreen.routeName),
        icon: const Icon(Icons.settings),
      ),
      centerTitle: true,
      elevation: 25,
      actions: [
        IconButton(
          onPressed: () =>
              Navigator.pushNamed(context, WishListScreen.routeName),
          icon: const Icon(Icons.favorite),
        )
      ],
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
