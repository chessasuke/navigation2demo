import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            icon: Icon(FontAwesomeIcons.cog,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
            onPressed: () {
              PageManager.of(context).addSettings();
            })
      ],
    );
  }
}
