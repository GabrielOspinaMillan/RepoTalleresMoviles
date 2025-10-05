import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart';

class IsolateScreen extends StatefulWidget {
  const IsolateScreen({super.key});

  @override
  State<IsolateScreen> createState() => _IsolateScreenState();
}

class _IsolateScreenState extends State<IsolateScreen> {
  String _resultado = 'Presiona el botón para iniciar el cálculo';
  bool _calculando = false;

  // Función que ejecuta la tarea pesada en el Isolate
  static Future<void> _tareaPesada(SendPort sendPort) async {
    int suma = 0;
    if (kDebugMode) {
      print('⏳ Iniciando tarea pesada...');
    }

    // Simulamos una tarea pesada sumando números grandes
    for (var i = 0; i < 1000000000; i++) {
      suma += i;
    }

    if (kDebugMode) {
      print('✅ Tarea pesada completada, enviando resultado...');
    }

    // Enviamos el resultado al Isolate principal
    sendPort.send(suma);
  }

  // Método para iniciar el cálculo en un Isolate
  Future<void> _iniciarCalculo() async {
    setState(() {
      _calculando = true;
      _resultado = 'Calculando...';
    });

    try {
      // Creamos un puerto para recibir mensajes
      final receivePort = ReceivePort();

      // Iniciamos el Isolate
      await Isolate.spawn(_tareaPesada, receivePort.sendPort);

      // Esperamos el resultado
      final resultado = await receivePort.first;

      setState(() {
        _resultado = 'Resultado: $resultado';
      });
    } catch (e) {
      setState(() {
        _resultado = 'Error: $e';
      });
    } finally {
      setState(() {
        _calculando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate Demo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // Botón para regresar
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_calculando)
              const CircularProgressIndicator()
            else
              const Icon(Icons.calculate, size: 50),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _resultado,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculando ? null : _iniciarCalculo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Iniciar Cálculo Pesado',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}