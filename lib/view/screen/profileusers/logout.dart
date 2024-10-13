import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل خروج'),
      ),
      body: const Center(child: Text('صفحة تسجيل خروج')),
    );
  }
}
