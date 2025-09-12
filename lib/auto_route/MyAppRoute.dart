import 'package:flutter/material.dart';
import 'package:learning_flutter/auto_route/app_router_generator.dart';

class MyAppRoute extends StatelessWidget {
  final _appRouterGenerator = AppRouterGenerator();
  MyAppRoute({super.key}); // 👈 optional, adds key

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouterGenerator.config(),
    );
  }
}
