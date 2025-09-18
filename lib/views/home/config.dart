import 'package:flutter/material.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Tamaño de letra
          ListTile(
            leading: const Icon(Icons.format_size),
            title: const Text('Tamaño de la letra'),
            subtitle: Slider(
              value: _fontSize,
              min: 12,
              max: 32,
              divisions: 10,
              label: _fontSize.round().toString(),
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            trailing: Text('${_fontSize.round()}'),
          ),
        ],
      ),
    );
  }
}