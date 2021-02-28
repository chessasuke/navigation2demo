import 'package:flutter/material.dart';

import '../custom_appbar.dart';

class TestingScreen extends StatelessWidget {
  TestingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Just added this screen below'),
      ),
    );
  }
}
