import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation2demo/model/item_model.dart';
import 'package:navigation2demo/navigator/page_manager.dart';
import '../custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Flutter Navigator 2.0 Demo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
          ),
          Container(
            height: 200,
            child: Consumer(builder: (context, watch, child) {
              final itemList = watch(itemsProvider);
              return ListView(
                children: [
                  for (var item in itemList)
                    ListTile(
                      title: Text(item.getName),
                      onTap: () {
                        PageManager.of(context).handleOnTapped(item.getId);
                      },
                    )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
