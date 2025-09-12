// home_page.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/auto_route/app_router_generator.dart';

@RoutePage() // 👈 Mark this class as a route
class BlueScreen extends StatelessWidget {
  final String message; // we can pass data here
  const BlueScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blue Screen")),
      body: Center(
        child: Column(
          children: [
            Text(message),
            const SizedBox(height: 16,),
            ElevatedButton(
              child: const Text("Go to Green Screen"),
              onPressed: () {
                // Navigation will come later
                context.router.push(GreenTabRoute(message: 'Hello from blue screen'));


              },
            ),
          ],
        ),
      ),
    );
  }
}
