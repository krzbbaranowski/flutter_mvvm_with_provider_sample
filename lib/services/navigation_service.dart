import 'package:flutter/cupertino.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationService(this.navigatorKey);

  Future<T> navigateToPage<T>(Widget destination, {Object? argument}) async {
    return await navigatorKey.currentState?.push(CupertinoPageRoute(
        builder: (context) => destination,
        settings: RouteSettings(
            name: destination.runtimeType.toString(), arguments: argument)));
  }
}
