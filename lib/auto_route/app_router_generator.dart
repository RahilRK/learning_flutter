// lib/auto_route/app_router_generator.dart
import 'package:auto_route/auto_route.dart';
import 'package:learning_flutter/auto_route/screens/blue_screen.dart';
import 'package:learning_flutter/auto_route/screens/green_tab.dart';
import 'package:learning_flutter/auto_route/screens/red_screen.dart';

part 'app_router_generator.gr.dart'; // must be "part", not "import"

@AutoRouterConfig()
class AppRouterGenerator extends  RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: RedRoute.page, initial: true),
    AutoRoute(page: BlueRoute.page),
    AutoRoute(
        // path: "/greenTab",
        page: GreenTabRoute.page),
  ];
}
