import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GreenTabScreen extends StatelessWidget {
  final String message; // we can pass data here
  const GreenTabScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Green Tab'),),
      body: Center(
        child: Column(
          children: [
            Text(message),
          ],
        ),
      ),
    );
  }
}
