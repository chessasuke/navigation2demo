import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemsProvider = Provider<List<Item>>((ref) {
  /// An example list of Item, in real life this will be dynamic of course
  List<Item> someList = [
    Item('0', 'item1'),
    Item('1', 'item2'),
    Item('2', 'item3'),
  ];
  return someList;
});

class Item {
  Item(String id, String name)
      : _id = id,
        _name = name;
  String _id;
  String _name;

  get getId => _id;
  get getName => _name;
}
