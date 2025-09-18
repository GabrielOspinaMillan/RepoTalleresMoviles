import 'package:flutter/material.dart';
import 'package:taller1/widgets/custom_drawer.dart'; // Importa el CustomDrawer

class InfoTabGrid extends StatelessWidget {
  const InfoTabGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar con GridView'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on), text: 'Grid 1'),
              Tab(icon: Icon(Icons.star), text: 'Grid 2'),
              Tab(icon: Icon(Icons.favorite), text: 'Grid 3'),
            ],
          ),
        ),
        drawer: const CustomDrawer(), // <-- Añade el drawer aquí
        body: const TabBarView(
          children: [
            _GridExample(color: Colors.blue, label: 'Grid 1'),
            _GridExample(color: Colors.green, label: 'Grid 2'),
            _GridExample(color: Colors.purple, label: 'Grid 3'),
          ],
        ),
      ),
    );
  }
}

class _GridExample extends StatelessWidget {
  final Color color;
  final String label;

  const _GridExample({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 columnas
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              '$label\nItem ${index + 1}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}