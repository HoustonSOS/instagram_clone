import 'package:flutter/material.dart';

class NestedNavigator extends StatefulWidget {
  const NestedNavigator({
    Key? key,
    this.routes,
    required this.navigatorKey,
    this.navigatorObservers = const <NavigatorObserver>[],
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;

  final Map<String, WidgetBuilder>? routes;

  final List<NavigatorObserver> navigatorObservers;

  @override
  State<NestedNavigator> createState() => _NestedNavigatorState();
}

class _NestedNavigatorState extends State<NestedNavigator> {

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      requestFocus: false,
      onGenerateRoute: _onGenerateRoute,
      // onUnknownRoute: _onUnknownRoute,
      observers: [HeroController()],
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings){
    final String? name = settings.name;
    WidgetBuilder? routeBuilder;

    // print(name);

    routeBuilder = widget.routes![name];

    // print(routeBuilder);

    return PageRouteBuilder(
        pageBuilder: (context, anim1, anim2) => routeBuilder!(context),
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (context, anim1, anim2, child){
          return FadeTransition(opacity: anim1, child: child,);
        },
        settings: settings,
    );
  }

  // Route<dynamic>? _onUnknownRoute(RouteSettings settings) {
  //   assert(() {
  //     if (widget.onUnknownRoute == null) {
  //       throw FlutterError(
  //         'Could not find a generator for route $settings in the $runtimeType.\n'
  //             'Generators for routes are searched for in the following order:\n'
  //             ' 1. For the "/" route, the "builder" property, if non-null, is used.\n'
  //             ' 2. Otherwise, the "routes" table is used, if it has an entry for '
  //             'the route.\n'
  //             ' 3. Otherwise, onGenerateRoute is called. It should return a '
  //             'non-null value for any valid route not handled by "builder" and "routes".\n'
  //             ' 4. Finally if all else fails onUnknownRoute is called.\n'
  //             'Unfortunately, onUnknownRoute was not set.',
  //       );
  //     }
  //     return true;
  //   }());
  //   final Route<dynamic>? result = widget.onUnknownRoute!(settings);
  //   assert(() {
  //     if (result == null) {
  //       throw FlutterError(
  //         'The onUnknownRoute callback returned null.\n'
  //             'When the $runtimeType requested the route $settings from its '
  //             'onUnknownRoute callback, the callback returned null. Such callbacks '
  //             'must never return null.',
  //       );
  //     }
  //     return true;
  //   }());
  //   return result;
  // }
}
