import 'package:flutter/material.dart';
import 'package:navigation2demo/theme_button.dart';

class CustomAppBar extends AppBar {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        ToggleBrightness(),
        IconButton(icon: Icon(Icons.settings), onPressed: () {})
      ],
    );
  }
}
