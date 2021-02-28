import 'package:flutter/material.dart';
import 'package:navigation2demo/navigator/route_path.dart';
import 'package:navigation2demo/screens/detail_screen.dart';
import 'package:navigation2demo/screens/home_screen.dart';
import 'package:navigation2demo/screens/settings_screen.dart';
import 'package:navigation2demo/screens/testing_screen.dart';
import 'package:navigation2demo/screens/unknown_screen.dart';
import 'package:provider/provider.dart';

class PageManager extends ChangeNotifier {
  static PageManager of(BuildContext context) {
    return Provider.of<PageManager>(context, listen: false);
  }

  /// Here we are storing the current list of pages
  List<Page> get pages => List.unmodifiable(_pages);
  List<Page> _pages = [];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PageManager() {
    _pages = [
      MaterialPage(
        child: HomeScreen(),
        key: const Key('HomeScreen'),
        name: '/',
      ),
    ];
  }

  TheAppPath get currentPath {
    Uri uri = Uri.parse(_pages.last.name);
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return TheAppPath.home();
    }

    // Handle '/details/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'details') return TheAppPath.unknown();
      var id = uri.pathSegments[1];
      if (id == null) return TheAppPath.unknown();
      return TheAppPath.details(id);
    }

    // Handle unknown routes
    return TheAppPath.unknown();
  }

  void didPop(Page page) {
    _pages.remove(page);
    notifyListeners();
  }

  /// This is where we handle new route information and manage the pages list
  Future<void> setNewRoutePath(TheAppPath configuration) async {
    if (configuration.isUnknown) {
      // Handling 404
      _pages.add(
        MaterialPage(
          child: UnknownScreen(),
          key: UniqueKey(),
          name: '/404',
        ),
      );
    } else if (configuration.isDetailsPage) {
      // Handling details screens
      _pages.add(
        MaterialPage(
          child: DetailsScreen(id: configuration.id),
          key: UniqueKey(),
          name: '/details/${configuration.id}',
        ),
      );
    } else if (configuration.isHomePage) {
      // Restoring to MainScreen
      _pages.removeWhere(
        (element) => element.key != const Key('HomeScreen'),
      );
    } else if (configuration.isSettings) {
      // Restoring to MainScreen
      _pages.add(MaterialPage(
        child: SettingsScreen(),
        key: UniqueKey(),
        name: '/settings',
      ));
    }
    notifyListeners();
    return;
  }

  void handleOnTapped(String itemID) {
    setNewRoutePath(TheAppPath.details(itemID));
  }

  void addSettings() {
    setNewRoutePath(TheAppPath.settings());
  }

  void addDetailsBelow() {
    _pages.insert(
      _pages.length - 1,
      MaterialPage(
        child: TestingScreen(),
        key: UniqueKey(),
        name: '/testing',
      ),
    );
    notifyListeners();
  }
}
