import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation2demo/custom_appbar.dart';
import 'package:navigation2demo/model/item_model.dart';
import 'package:navigation2demo/navigator/page_manager.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  DetailsScreen({@required this.id, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(builder: (context, watch, child) {
          final itemList = watch(itemsProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (id != null) ...[
                Text(
                    itemList
                        .where((element) => element.getId == id)
                        .first
                        .getName,
                    style: Theme.of(context).textTheme.headline6),
              ],
              const SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: TextButton(
                      onPressed: () {
                        PageManager.of(context).addDetailsBelow();
                      },
                      child: Text('Add Testing Page Below This One',
                          style: Theme.of(context).primaryTextTheme.bodyText2)),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
