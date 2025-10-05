import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AsincroniaScreen extends StatefulWidget {
  const AsincroniaScreen({super.key});

  @override
  State<AsincroniaScreen> createState() => _AsincroniaScreenState();
}

class _AsincroniaScreenState extends State<AsincroniaScreen> {
  String _estado = 'Presiona el botón para iniciar';
  bool _isLoading = false;

  // Simula una consulta a un servicio
  Future<String> _consultarDatos() async {
    if (kDebugMode) {
      print('⏳ Antes de la consulta');
    }

    try {
      setState(() {
        _isLoading = true;
        _estado = 'Cargando...';
      });

      // Simula un delay de 3 segundos
      await Future.delayed(const Duration(seconds: 3));
      
      if (kDebugMode) {
        print('🔄 Durante la consulta');
      }

      // Simula éxito o error aleatoriamente
      if (DateTime.now().second.isEven) {
        throw Exception('Error simulado');
      }

      return 'Datos consultados con éxito!';
    } catch (e) {
      rethrow; // Relanza el error para manejarlo en el caller
    } finally {
      if (kDebugMode) {
        print('✅ Después de la consulta');
      }
    }
  }

  // Maneja la consulta y actualiza la UI
  Future<void> _iniciarConsulta() async {
    try {
      final resultado = await _consultarDatos();
      setState(() {
        _estado = resultado;
      });
    } catch (e) {
      setState(() {
        _estado = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // Botón para regresar
        ),
        title: const Text('Asincronía en Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              const CircularProgressIndicator()
            else
              const Icon(Icons.cloud_queue, size: 50),
            const SizedBox(height: 20),
            Text(
              _estado,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _iniciarConsulta,
              child: const Text('Consultar datos'),
            ),
          ],
        ),
      ),
    );
  }
}