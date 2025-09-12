// home_page.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../app_router_generator.dart';

@RoutePage() // 👈 This tells AutoRoute this is a route
class RedScreen extends StatelessWidget {
  const RedScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Red Screen")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Go to Blue Screen"),
          onPressed: () {
            // Navigation will come later
            context.pushRoute(
              BlueRoute(message: "Hello from Red Screen!"),
            );

          },
        ),
      ),
    );
  }
}
