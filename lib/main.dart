import 'package:flutter/material.dart';
import 'package:layout_app/layout_view.dart';

void main() => runApp(const LayoutApplication());

class LayoutApplication extends StatelessWidget {
  const LayoutApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LayoutView(),
    );
  }
}
