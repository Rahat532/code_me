import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: const Center(
          child: Text("Setting"),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.amberAccent,
        elevation: 0,
      ),
    );
  }
}
