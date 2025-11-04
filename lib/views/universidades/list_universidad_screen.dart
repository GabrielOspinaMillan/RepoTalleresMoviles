import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taller1/firebase_options.dart';
import 'package:taller1/models/universidades.dart';
import 'package:taller1/widgets/custom_drawer.dart';

class ListUniversidadScreen extends StatelessWidget {
  const ListUniversidadScreen({super.key});

  Future<void> _ensureFirebaseInitialized() {
    // Inicializa solo si no hay apps ya registradas (evita doble inicialización)
    return Firebase.apps.isEmpty
        ? Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
        : Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ensureFirebaseInitialized(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Lista de universidades')),
            body: Center(child: Text('Error inicializando Firebase: ${snapshot.error}')),
          );
        }

        final col = FirebaseFirestore.instance.collection('universidades').orderBy('nombre');

        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de universidades'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go('/universidades'), // Botón para regresar
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Crear universidad',
                onPressed: () => context.go('/universidad_create'),
              ),
            ],
          ),
          drawer: const CustomDrawer(),
          body: StreamBuilder<QuerySnapshot>(
            stream: col.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final docs = snapshot.data!.docs;
              if (docs.isEmpty) {
                return const Center(child: Text('No hay universidades registradas.'));
              }

              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: docs.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final d = docs[index].data() as Map<String, dynamic>;
                  final uni = Universidades(
                    nit: d['nit'] ?? docs[index].id,
                    nombre: d['nombre'] ?? '',
                    direccion: d['direccion'] ?? '',
                    telefono: d['telefono'] ?? '',
                    paginaweb: d['paginaweb'] ?? '',
                  );

                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: const Icon(Icons.school),
                      title: Text(uni.nombre),
                      subtitle: Text('NIT: ${uni.nit}\n${uni.direccion}'),
                      isThreeLine: true,
                      trailing: PopupMenuButton<String>(
                        onSelected: (v) async {
                          if (v == 'delete') {
                            await FirebaseFirestore.instance
                                .collection('universidades')
                                .doc(d['nit'] ?? docs[index].id)
                                .delete();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Universidad eliminada')));
                            }
                          }
                        },
                        itemBuilder: (_) => const [
                          PopupMenuItem(value: 'delete', child: Text('Eliminar')),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}