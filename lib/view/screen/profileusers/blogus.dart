

import 'package:flutter/material.dart';

class Blogus extends StatelessWidget {
  const Blogus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' المدونة'),
      ),
      body: const Center(child: Text('صفحة المدونة')),
    );
  }
}