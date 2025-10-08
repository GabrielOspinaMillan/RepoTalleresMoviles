import 'package:flutter/material.dart';
import 'package:taller1/models/themeal.dart';
import 'package:taller1/services/api_services.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> _futureCategories;
  final ApiService _api = ApiService();

  @override
  void initState() {
    super.initState();
    _futureCategories = _api.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías de Comida'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
           onPressed: () => context.go('/'), // Botón para regresar // Botón para regresar
        ),
      ),
      body: FutureBuilder<List<Category>>(
        future: _futureCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print('Cargando categorías...');
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error al cargar categorías: ${snapshot.error}');
            // Error
            return Center(
              child: Text(
                'Ocurrió un error:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Datos vacíos
            return const Center(child: Text('No se encontraron categorías'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            print('Categorías cargadas con éxito: ${snapshot.data!.length}');
            // Éxito: mostrar lista
            final categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                return ListTile(
                  leading: Image.network(
                    cat.thumbnail,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(cat.name),
                  subtitle: Text(
                    cat.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    context.pushNamed(
                      'CategoriaDetalle',
                      extra: {
                        'id': cat.idCategory,
                        'nombre': cat.name,
                        'imagen': cat.thumbnail,
                        'descripcion': cat.description,
                      },
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No se encontraron categorías'));
          }
        },
      ),
    );
  }
}
