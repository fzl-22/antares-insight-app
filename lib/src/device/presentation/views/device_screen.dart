import 'package:flutter/material.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({super.key});

  static const name = 'device';
  static const path = '/device';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perangkat Terhubung'),
      ),
      body: const Center(
        child: Text(path),
      ),
    );
  }
}
