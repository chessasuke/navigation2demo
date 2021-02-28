import 'package:flutter/material.dart';
import 'package:navigation2demo/theme_button.dart';

import 'navigator/page_manager.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        ToggleBrightness(),
        IconButton(
            icon: Icon(Icons.settings, color: Theme.of(context).hintColor),
            onPressed: () {
              PageManager.of(context).addSettings();
            })
      ],
    );
  }
}
