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

  /// Handles updating the current path (last page)
  TheAppPath get currentPath {
    Uri uri = Uri.parse(_pages.last.name);

    /// Handle '/'
    if (uri.pathSegments.isEmpty) {
      return TheAppPath.home();
    }

    /// Handle '/details/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'details') return TheAppPath.unknown();
      var id = uri.pathSegments[1];
      if (id == null) return TheAppPath.unknown();
      return TheAppPath.details(id);
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'settings')
        return TheAppPath.settings();
      else if (uri.pathSegments[0] == 'testing') return TheAppPath.testing();

      return TheAppPath.unknown();
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
//    print('---------------------------------------------');
//    print('configuration.id: ${configuration.id} ');
//    print('configuration.isSettingsPage: ${configuration.isSettingsPage}');
//    print('configuration.isHomePage: ${configuration.isHomePage}');
//    print('configuration.isDetailsPage: ${configuration.isDetailsPage}');
//    print('configuration.isUnknownPage: ${configuration.isUnknownPage}');
//    print('VARIABLES');
//    print('configuration.isSettings: ${configuration.isSettings}');
//    print('configuration.isUnknown: ${configuration.isUnknown}');
//    print('---------------------------------------------');

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
      print('adding settings');
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

  void resetToHome() {
    setNewRoutePath(TheAppPath.home());
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
