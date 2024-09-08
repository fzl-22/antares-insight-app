import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  static const name = 'service';
  static const path = '/service';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layanan'),
      ),
      body: const Center(
        child: Text(path),
      ),
    );
  }
}
