import 'package:flutter/material.dart';
import 'route_path.dart';

///
/// Two important classes in Navigation 2.0 - RouteInformationParser and RouterDelegate
/// The RouteInformationParser have two important functions
/// - converts the configuration (navigation state) into a RouteInformation (uri)
/// using the parseRouteInformation function.
/// - converts the RouteInformation (uri) into a configuration (navigation state)
/// using the parseRoute
///
/// When the engine pushes a new route, the route information is parsed by the
/// RouteInformationParser to produce a configuration of type T.
///

class BookRouteInformationParser extends RouteInformationParser<TheAppPath> {
  /// call when there is a change to the URL in the browser
  /// converts the url into a navigation state
  @override
  Future<TheAppPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    /// Handle '/'
    if (uri.pathSegments.length == 0) {
      return TheAppPath.home();
    }

    /// Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] != 'book') return TheAppPath.unknown();
      var remaining = uri.pathSegments[1];
      if (remaining == null) return TheAppPath.unknown();
      return TheAppPath.details(remaining);
    }

    /// Handle unknown routes
    return TheAppPath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(TheAppPath path) {
    if (path.isUnknown) {
      print('path is unknown');

      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      print('path is home');
      return RouteInformation(location: '/');
    }

    if (path.isDetailsPage) {
      print('path is details');

      return RouteInformation(location: '/book/${path.id}');
    }
    return null;
  }
}