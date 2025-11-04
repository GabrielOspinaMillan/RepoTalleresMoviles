import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taller1/widgets/custom_drawer.dart';

class UniversidadesScreen extends StatelessWidget {
  const UniversidadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // Botón para regresar
        ),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 1,
              shrinkWrap: true,
              mainAxisSpacing: 16,
              childAspectRatio: 3.2,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.indigo,
                          child: Icon(Icons.school, color: Colors.white, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Ver universidades', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Explora la lista de universidades registradas.'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => context.go('/universidades_list'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                          child: const Text('Ver'),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.teal,
                          child: Icon(Icons.add_business, color: Colors.white, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Crear universidad', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Registra una nueva universidad en el sistema.'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => context.go('/universidad_create'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                          child: const Text('Crear'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Opcional: ayuda o nota
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selecciona una acción para continuar.',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
