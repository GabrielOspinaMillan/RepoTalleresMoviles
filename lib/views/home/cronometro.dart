import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CronometroScreen extends StatefulWidget {
  const CronometroScreen({super.key});

  @override
  State<CronometroScreen> createState() => _CronometroScreenState();
}

class _CronometroScreenState extends State<CronometroScreen> {
  int _segundos = 0;
  Timer? _timer;
  bool _estaCorriendo = false;
  bool _enPausa = false;

  void _iniciar() {
    setState(() {
      _estaCorriendo = true;
      _enPausa = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _segundos++;
      });
    });
  }

  void _pausar() {
    _timer?.cancel();
    setState(() {
      _enPausa = true;
      _estaCorriendo = false;
    });
  }

  void _reanudar() {
    _iniciar();
  }

  void _reiniciar() {
    _timer?.cancel();
    setState(() {
      _segundos = 0;
      _estaCorriendo = false;
      _enPausa = false;
    });
  }

  String _formatearTiempo() {
    int horas = _segundos ~/ 3600;
    int minutos = (_segundos % 3600) ~/ 60;
    int segundos = _segundos % 60;
    return '${horas.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel(); // Limpieza del timer al salir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cronómetro'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // Botón para regresar
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatearTiempo(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_estaCorriendo && !_enPausa) ...[
                  _BotonCronometro(
                    onPressed: _iniciar,
                    icon: Icons.play_arrow,
                    texto: 'Iniciar',
                    color: Colors.green,
                  ),
                ] else if (_estaCorriendo) ...[
                  _BotonCronometro(
                    onPressed: _pausar,
                    icon: Icons.pause,
                    texto: 'Pausar',
                    color: Colors.orange,
                  ),
                ] else if (_enPausa) ...[
                  _BotonCronometro(
                    onPressed: _reanudar,
                    icon: Icons.play_arrow,
                    texto: 'Reanudar',
                    color: Colors.green,
                  ),
                ],
                const SizedBox(width: 20),
                _BotonCronometro(
                  onPressed: _reiniciar,
                  icon: Icons.replay,
                  texto: 'Reiniciar',
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BotonCronometro extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String texto;
  final Color color;

  const _BotonCronometro({
    required this.onPressed,
    required this.icon,
    required this.texto,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(texto, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}