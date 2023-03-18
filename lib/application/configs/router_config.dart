import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RouterConfig {
  final router = <GoRoute>[];

  RouterConfig add(Widget widget) {
    router.add(buildRouteByWidget(widget));
    return this;
  }

  GoRouter buildRouter() {
    return GoRouter(initialLocation: router.first.path, routes: router);
  }

  static String buildRouteName(Type type) {
    return '/${type.toString().toLowerCase()}';
  }

  GoRoute buildRouteByWidget(Widget widget) {
    var routeName = buildRouteName(widget.runtimeType);
    return GoRoute(
        path: routeName,
        pageBuilder: (context, state) => CustomTransitionPage(
            child: widget,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child));
  }
}
